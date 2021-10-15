import processing.sound.*; 
SoundFile song;

float x, y;
float xPos, yPos;

int seconds;
String time;
boolean pressed;
boolean mainMenuBox;

int score;

void setup() {
  song = new SoundFile(this, "gameMusic.mp3");
  song.play();
  size(1280, 720);
  x = random(10, 1280);
  y = random(10, 720);
  pressed = false;
  mainMenuBox = true;
  

}

void draw() {
  background(#272727);

  if (pressed) {  //calls functions once pressed
    scoreDisplay();
    timer();
    mainMenuBox = false;  //removes box once the game starts


    float distance = dist(mouseX, mouseY, x, y);
    if (distance < 30) {
      fill(0, 0, 255);
    } else {
      fill( 255, 0, 0);
    }

    circle(x, y, 50);
    gameOver();
  }
  menuTitle();
  mainMenuStartButton();
}

void menuTitle() {
  if (mainMenuBox) {
    textSize(56);
    text("Mouse Accuracy Trainer Mania Deluxe 2", xPos-1100, yPos/2);
  }
}

void mainMenuStartButton() {
  if (mainMenuBox) {
    xPos = width;
    yPos = height;
    rectMode(CENTER);
    fill(100);
    rect(xPos/2, yPos-200, 200, 100, 28);
    fill(255);
    textSize(48);
    text("Practice!", xPos-725, yPos-185);
  }
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

  if ( mouseX > xPos/2-100 &&  //main menu box boundaries
    mouseX < xPos/2+100 &&
    mouseY > yPos-200-50 &&
    mouseY < yPos-200+50 ) {
    pressed = true;  //if pressed then it changes values
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
