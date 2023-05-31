// variables
PImage background, playButton, title;
int Width;
int Height;

// class
public class Menu {
  
  // constructor
  public Menu() {
    Width = 1920;
    Height = 1080;
  }

// methods
void menuLoad() {
   background = loadImage("background.jpg");
   playButton = loadImage("playButton.png");
   title = loadImage("title.png");
  }

void menuPlace() {
   image(background, 0, 0);
   image(playButton,0,Height/2);
   image(title,Width/2-400,0);
    }
}
