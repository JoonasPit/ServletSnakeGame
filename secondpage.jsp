<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href ="css/styles.css">
	<link href="https://fonts.googleapis.com/css?family=Bungee+Inline" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet"> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SecondPage</title>
</head>
	<bodir>
	<h1>The Second Page</h1>
	<p class ="playingas">Currently playing as: <c:out value="${inUserName}"></c:out></p>
	<input type = "hidden" value="${inColor}" id= "jsInColor">

	<canvas id = "canvasForGame" width="300" height = "300"></canvas>

		<div id ="current">Current Score: </div><div id = "score">0</div>
	 <script>
      /** constants and variables**/
      
      var snakeColor = document.getElementById('jsInColor').value;
	
      const CANVASBORDER_COLOR = 'black';
      const CANVAS_BACKGROUND = "white";
      var SNAKE_COLOR = '';
      if (snakeColor === 'blue'){
    	  SNAKE_COLOR = 'blue';
      }
      else if (snakeColor === 'green'){
    	  SNAKE_COLOR = 'lightgreen';
      }
      else if (snakeColor === 'yellow'){
    	  SNAKE_COLOR = 'yellow';
      }
	  
      const BORDER_COLOR_SNAKE = 'black';
      const PELLET_COLOR = 'black';
      const BORDER_COLOR_PELLET = 'black';
      let snake = [
        {x: 150, y: 150},
        {x: 140, y: 150},
        {x: 130, y: 150},
        {x: 120, y: 150},
        {x: 110, y: 150}
      ]
      // userscore as a let variable
      
      let score = 0;
      // x-vector speed
      
      let dirx = 10;
      // y vector speed
      
      let dir = 0;
      
      // gameCanvas as a variable and get it with document.getelementjne...
      var gameCanvas = document.getElementById("canvasForGame");
      
      // creates a 2d drawing from the javascript library? "2d" is the type of drawing
      var ctx = gameCanvas.getContext("2d");
      
      //  fillstyle is self explanatory. reads the previous const of canvas background
      ctx.fillStyle = CANVAS_BACKGROUND;
      
      //  Border color for canvas
      ctx.strokestyle = CANVASBORDER_COLOR;
      
      // draws the selected canvas
      ctx.fillRect(0, 0, gameCanvas.width, gameCanvas.height);
      
      // draws the border
      ctx.strokeRect(0, 0, gameCanvas.width, gameCanvas.height);
      
      // call main function to start the game!
      main();
      
      // call createfunction to create first pellet
      createPellet();
      
      // Call changeDirection whenever a key is pressed
      document.addEventListener("keydown", changeDirection);
      function main() {
        if (didGameEnd()) return;
        setTimeout(function onTick() {
          clearCanvas();
          drawFood();
          advanceSnake();
          drawSnake();
          // Call main again
          main();
        }, 100)
      }

      
      
      function clearCanvas() {
       
        ctx.fillStyle = CANVAS_BACKGROUND;
       
        ctx.strokestyle = CANVASBORDER_COLOR;
       
        ctx.fillRect(0, 0, gameCanvas.width, gameCanvas.height);
      
        ctx.strokeRect(0, 0, gameCanvas.width, gameCanvas.height);
      }
      /**
       * If snake hit walls or itself returns true
       */
      function didGameEnd() {
        for (let i = 4; i < snake.length; i++) {
          const didCollide = snake[i].x === snake[0].x && snake[i].y === snake[0].y
          if (didCollide) return true
        }
        const hitLeftWall = snake[0].x < 0;
        const hitRightWall = snake[0].x > gameCanvas.width - 10;
        const hitToptWall = snake[0].y < 0;
        const hitBottomWall = snake[0].y > gameCanvas.height - 10;
        return hitLeftWall || hitRightWall || hitToptWall || hitBottomWall
      }
      /**
       * Draw the food on the canvas
       */
      function drawFood() {
        ctx.fillStyle = PELLET_COLOR;
        ctx.strokestyle = BORDER_COLOR_PELLET;
        ctx.fillRect(foodirx, foodir, 10, 10);
        ctx.strokeRect(foodirx, foodir, 10, 10);
      }
      /**
       * Advances the snake by changing the x-coordinates of its parts
       * according to the horizontal velocity and the y-coordinates of its parts
       * according to the vertical veolocity
       */
      function advanceSnake() {
        // Create the new Snake's head
        const head = {x: snake[0].x + dirx, y: snake[0].y + dir};
        // Add the new head to the beginning of snake bodir
        snake.unshift(head);
        const didEatFood = snake[0].x === foodirx && snake[0].y === foodir;
        if (didEatFood) {
          // Increase score
          score += 5;
          // Display score on screen
          document.getElementById('score').innerHTML = score;
          // Generate new food location
          createPellet();
        } else {
          // Remove the last part of snake bodir
          snake.pop();
        }
      }
      /**
       * Generates a random number that is a multiple of 10 given a minumum
       * and a maximum number
       * @param { number } min - The minimum number the random number can be
       * @param { number } max - The maximum number the random number can be
       */
      function randomTen(min, max) {
        return Math.round((Math.random() * (max-min) + min) / 10) * 10;
      }
      /**
       * Creates random set of coordinates for the snake food.
       */
      function createPellet() {
        // Generate a random number the food x-coordinate
        foodirx = randomTen(0, gameCanvas.width - 10);
        // Generate a random number for the food y-coordinate
        foodir = randomTen(0, gameCanvas.height - 10);
        // if the new food location is where the snake currently is, generate a new food location
        snake.forEach(function isOnSnake(part) {
          if (part.x == foodirx && part.y == foodir) createPellet();
        });
      }
      /**
       * Draws the snake on the canvas
       */
      function drawSnake() {
        // loop through the snake parts drawing each part on the canvas
        snake.forEach(drawSnakePart)
      }
      /**
       * Draws a part of the snake on the canvas
       * @param { object } snakePart - The coordinates where the part should be drawn
       */
      function drawSnakePart(snakePart) {
        // Set the colour of the snake part
        ctx.fillStyle = SNAKE_COLOR;
        // Set the border colour of the snake part
        ctx.strokestyle = BORDER_COLOR_SNAKE;
        // Draw a "filled" rectangle to represent the snake part at the coordinates
        // the part is located
        ctx.fillRect(snakePart.x, snakePart.y, 10, 10);
        // Draw a border around the snake part
        ctx.strokeRect(snakePart.x, snakePart.y, 10, 10);
      }
      /**
       * Changes the vertical and horizontal velocity of the snake according to the
       * key that was pressed.
       * The direction cannot be switched to the opposite direction, to prevent the snake
       * from reversing
       * For example if the the direction is 'right' it cannot become 'left'
       * @param { object } event - The keydown event
       */
      function changeDirection(event) {
        const LEFT_KEY = 37;
        const RIGHT_KEY = 39;
        const UP_KEY = 38;
        const DOWN_KEY = 40;
        const keyPressed = event.keyCode;
        const goingUp = dir === -10;
        const goingDown = dir === 10;
        const goingRight = dirx === 10;
        const goingLeft = dirx === -10;
        if (keyPressed === LEFT_KEY && !goingRight) {
          dirx = -10;
          dir = 0;
        }
        if (keyPressed === UP_KEY && !goingDown) {
          dirx = 0;
          dir = -10;
        }
        if (keyPressed === RIGHT_KEY && !goingLeft) {
          dirx = 10;
          dir = 0;
        }
        if (keyPressed === DOWN_KEY && !goingUp) {
          dirx = 0;
          diry = 10;
        }
      }
    </script>
</bodir>
</html>
