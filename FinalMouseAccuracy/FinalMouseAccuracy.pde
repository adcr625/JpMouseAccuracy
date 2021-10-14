float x, y;

int seconds;
String time;

int score;

void setup() {
  size(1280, 720);
  x = random(10, 1280);
  y = random(10, 720);
}

void draw() {
  background(#272727);
  
  //insert play button here
  //inster replay button here
  
  timer();
  scoreDisplay();
  
  float distance = dist(mouseX, mouseY, x, y);
  if (distance < 30) {
    fill(0, 0, 255);
  } else {
    fill( 255, 0, 0);
  }
  
  circle(x, y, 50);
  gameOver();
}

void gameOver() {
  String message = "Score: " + score;
  if (seconds == 0) {
    background(#272727);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Game Over!", width/2, height/2 - 30);
    text(message, width/2, height/2 + 20);
    stop();
  }
}

void mouseClicked() {
  float distance = dist( mouseX, mouseY, x, y);

  if (distance < 30) {
    score++;
    x = random(10, 1280);
    y = random (10, 720);
  }
}

void timer() {
  seconds = (frameCount/60) % 60;
  seconds = 15 - seconds;
  time = nf(seconds);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text(time, width/2, 25);
}

void scoreDisplay() {
  String message = "Score: " + score;
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text(message, 100, 25);
}

void playButton() {
  
}
