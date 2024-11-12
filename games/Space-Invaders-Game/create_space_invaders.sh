#!/bin/bash

# Create project directory
mkdir SpaceInvadersGame
cd SpaceInvadersGame

# Create index.html
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Space Invaders</title>
    <style>
        body { margin: 0; overflow: hidden; }
        canvas { background: black; display: block; margin: 0 auto; }
        .controls { text-align: center; padding: 10px; }
        .controls button { padding: 10px; margin: 5px; }
    </style>
</head>
<body>
    <canvas id="gameCanvas"></canvas>
    <div class="controls">
        <button id="left-btn">Left</button>
        <button id="right-btn">Right</button>
        <button id="fire-btn">Fire</button>
    </div>

    <script src="game.js"></script>
</body>
</html>
EOL

# Create game.js
cat <<EOL > game.js
const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

const player = {
    x: canvas.width / 2 - 20,
    y: canvas.height - 60,
    width: 40,
    height: 20,
    dx: 5
};

const bullets = [];
const enemies = [];
const enemyRowCount = 3;
const enemyColumnCount = 8;
const enemyWidth = 40;
const enemyHeight = 20;
const enemyPadding = 20;
const enemyOffsetTop = 30;
const enemyOffsetLeft = 30;

let rightPressed = false;
let leftPressed = false;

function drawPlayer() {
    ctx.fillStyle = 'green';
    ctx.fillRect(player.x, player.y, player.width, player.height);
}

function drawEnemies() {
    for (let i = 0; i < enemyRowCount; i++) {
        for (let j = 0; j < enemyColumnCount; j++) {
            const enemyX = j * (enemyWidth + enemyPadding) + enemyOffsetLeft;
            const enemyY = i * (enemyHeight + enemyPadding) + enemyOffsetTop;
            enemies.push({ x: enemyX, y: enemyY, width: enemyWidth, height: enemyHeight });
        }
    }
    enemies.forEach((enemy) => {
        ctx.fillStyle = 'red';
        ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);
    });
}

function drawBullets() {
    bullets.forEach((bullet, index) => {
        ctx.fillStyle = 'yellow';
        ctx.fillRect(bullet.x, bullet.y, bullet.width, bullet.height);
        bullet.y -= bullet.dy;

        // Remove bullet if it goes off screen
        if (bullet.y + bullet.height < 0) {
            bullets.splice(index, 1);
        }
    });
}

function movePlayer() {
    if (rightPressed && player.x < canvas.width - player.width) {
        player.x += player.dx;
    } else if (leftPressed && player.x > 0) {
        player.x -= player.dx;
    }
}

function shootBullet() {
    bullets.push({
        x: player.x + player.width / 2 - 2.5,
        y: player.y,
        width: 5,
        height: 10,
        dy: 6
    });
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawPlayer();
    drawEnemies();
    drawBullets();
    movePlayer();

    requestAnimationFrame(draw);
}

document.addEventListener('keydown', (event) => {
    if (event.key === 'Right' || event.key === 'ArrowRight') {
        rightPressed = true;
    } else if (event.key === 'Left' || event.key === 'ArrowLeft') {
        leftPressed = true;
    } else if (event.key === 'Space') {
        shootBullet();
    }
});

document.addEventListener('keyup', (event) => {
    if (event.key === 'Right' || event.key === 'ArrowRight') {
        rightPressed = false;
    } else if (event.key === 'Left' || event.key === 'ArrowLeft') {
        leftPressed = false;
    }
});

// Touch Controls
document.getElementById('left-btn').addEventListener('touchstart', () => { leftPressed = true; });
document.getElementById('left-btn').addEventListener('touchend', () => { leftPressed = false; });
document.getElementById('right-btn').addEventListener('touchstart', () => { rightPressed = true; });
document.getElementById('right-btn').addEventListener('touchend', () => { rightPressed = false; });
document.getElementById('fire-btn').addEventListener('touchstart', shootBullet);

draw();
EOL

echo "Space Invaders game has been created with touch and keyboard controls."
