PImage background, playButton, title;

void setup() {
 size(1280,720); 
 background = loadImage("background.jpg");
 playButton = loadImage("playButton.png");
 title = loadImage("title.png");
}

void draw() {
 image(background, 0, 0);
 image(playButton,0,200);
 image(title,220,0);
}

void play() {
 if (mouseX >= 0 && mouseX <=320 && mouseY >= 200 && mouseY <= 360) {
  worldSpace world = new worldSpace();
 }
}
