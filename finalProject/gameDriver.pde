// variables
boolean gameStarted;
int startValue;
// objects
Menu menu = new Menu();  
Game game = new Game();

// detection
 void mouseClicked() {
  if (startValue == 0) {
    startValue = 255;
    } else {
    startValue = 0;
    }
  }
  
void detect() {
 if (mouseX > 0 && 
     mouseX < 320 &&
     mouseY > height/2 &&
     mouseY < height/2 + 160) 
     {
      if (startValue == 255 ) {
        gameStarted = true; 
       }
  }
}


// game function
void setup() {
  size(1920,1080); 
  gameStarted = false;
}

void draw() {
  
  detect();
  if (gameStarted == false) {
        menu.menuLoad();
        menu.menuPlace();
  } else {
        gameRun();
  }  
  
}

void gameRun() {
  game.gameBackLoad();
  game.gameBackPlace();
  game.gameWorld();
  game.keyPressing();
  game.spawn();
}
