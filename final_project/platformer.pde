// sound import
import processing.sound.*;
SoundFile menuMusic;
SoundFile gameMusic;

// var
PImage img, img2, img3;
ArrayList<Platform> p;
boolean iscolliding = false;
boolean value;
boolean gameStarted;
PVector pos;
PVector vel;
PVector star0;
PVector goal;
float moving = 0;
float walk = 4;
int startValue;
int worldSpawned = 0;
int starCount = 0;

// obj
Menu menu = new Menu(); 

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


// game setup
void setup() {
  gameStarted = false;
  worldSpawn();
  
}

 void settings() {
   size(1920,1080);
   
   if (gameStarted == false) {
   menuMusic = new SoundFile(this, "pro.mp3");
   menuMusic.play();
   menuMusic.loop();
   gameMusic = new SoundFile(this, "game.mp3");
   gameMusic.play();
   gameMusic.pause();
   }
   
}
 
// running the game 
 void draw() {
   
   detect();
  if (gameStarted == false) {
        menu.menuLoad();
        menu.menuPlace();
       
        
  } else {
        println("X = " + mouseX, "Y = " + mouseY);
    
        gameRun();
        //println(worldSpawned);
        
        gameStarted = true;
        if (menuMusic.isPlaying() == true) {
         menuMusic.stop(); 
         
        }
        if (gameMusic.isPlaying() == false) {
         gameMusic.play();
         gameMusic.loop();
          
        }
        
        
  }  
   
   
 }

// helper methods
void reset() {
 pos.x = 140;
 pos.y = height/2; 
}

// background

void backgroundLoad() {
 img = loadImage("space1.png"); 
}

void backgroundPlace() {
  image(img, 0, 0, width, height);
}

// star
void starCountText() {
  textSize(48);
  text("" + starCount, 64, 56);
}

void loadStarImg() {
 img3 = loadImage("star.png"); 
  
}

void placeStarImg() {
 image(img3, star0.x, star0.y, 48, 48); 
  
}

void placeStarCount() {
 image(img3, 16, 16, 48, 48); 
  
}


// player
void loadPlayImg() {
  img2 = loadImage("player.png");
  
}

void placePlayImg() {
  image(img2, pos.x-32, pos.y-64, 64, 64);
  
}

// game
void gameRun() {
  gameMechanics();
  world();  
  stars();
  goals();
//////////////////// 
  loadPlayImg();
  placePlayImg();
//////////////////// 
  loadStarImg();
  placeStarImg();
  placeStarCount();
  starCountText();
  
}

void gameMechanics() {
   background(#07050A);
   grapple();
   iscolliding = false;
   for(Platform i: p) {
     i.show();
     if(i.collide(pos)) {
       iscolliding = true;
       println("COLLIDING");
       pos.y = i.Rpos.y;
     }
   }
   if(pos.y > height) {
     reset();
   }
   //fill(255, 0, 0);
   stroke(0);
   //ellipse(pos.x, pos.y, 16, 16);
   if(!iscolliding) {
   vel.y += 0.5;
   }
   pos.add(vel);
   pos.x += moving;
   vel.mult(0.9);
   //println(vel.y);
 }

// world
void worldSpawn() {
 p = new ArrayList<Platform>();
   float y = height/2;
   float ory = y;
/////////////////////// WORLD 0
   if (worldSpawned == 0) {
     p.add(new Platform(120,ory+10,100));
     p.add(new Platform(270,600,100));
     p.add(new Platform(370,630,150));
     p.add(new Platform(570,650,100));
     p.add(new Platform(620,650,100));
     p.add(new Platform(770,670,100));
     p.add(new Platform(920,690,100));
     p.add(new Platform(1020,650,100));
     p.add(new Platform(1320,650,100));
     p.add(new Platform(1420,650,100));
     // last
     p.add(new Platform(1520,650,100)); 
     
   star0 = new PVector(1070-24, 650-56);
   pos = new PVector(140, ory);
   vel = new PVector ();
   goal = new PVector(1520, 620);
   }
/////////////////////// WORLD 1
  if (worldSpawned == 1) {
     p.add(new Platform(120,ory+110,100));
     p.add(new Platform(260,900,75));
     p.add(new Platform(885,1000,100));
     p.add(new Platform(1085,950,100));
     p.add(new Platform(1520,900,70));
     p.add(new Platform(1660,870,50));
     p.add(new Platform(1835, 850, 50));
     p.add(new Platform(1570,810,70));
     p.add(new Platform(1725, 750, 50));
     p.add(new Platform(1420,650,100));
     //p.add(new Platform(1660,600,100));
     p.add(new Platform(1450,580,100));
     p.add(new Platform(1660,530,75));
     p.add(new Platform(1680,480,100));
     p.add(new Platform(1100,470,300));
     p.add(new Platform(800,350,500));
     p.add(new Platform(800,250,200));
     
     //last
     p.add(new Platform(1000,150,100));
     
   star0 = new PVector(1070-24, 650-56);
   pos = new PVector(140, ory);
   vel = new PVector ();
   goal = new PVector(1050, 125);
   
   }

/////////////////////// WORLD 2

/////////////////////// WORLD 3

/////////////////////// WORLD 4
   
}
 
void world() {
  // border shapes
 fill(0);
 rect(0, 0, 100, height);
 
 fill(0);
 rect(width-100, 0, 100, height);
 
 // walls
 if (pos.x > width-116)  pos.x = width-116; 
 if (pos.x < 100)  pos.x = 100;
 
 // platform shapes
 
 /////////////// WORLD 0
 if (worldSpawned == 0) {
 //fill(#BCB5BF);
 ////rect(120, (height/2+10), 100, 50);
 ////rect(270, 600, 100, 50);
 ////rect(370, 630, 150, 50);
 ////rect(570, 650, 150, 50);
 ////rect(770, 670, 100, 50);
 ////rect(920, 690, 100, 50);
 ////rect(1020, 650, 100, 50);
 ////rect(1320, 650, 300, 50);
 }
 
 /////////////// WORLD 1
 if (worldSpawned == 1) {
 fill(#BCB5BF);
 //rect(120, (height/2+10), 100, 50);
 //rect(270, 630, 100, 50);
 //rect(370, 700, 150, 50);
 //rect(570, 650, 150, 50);
 //rect(770, 670, 100, 50);
 //rect(920, 690, 100, 50);
 //rect(1020, 650, 100, 50);
 //rect(1320, 650, 300, 50);
 noStroke();
 rect(0,0,400,150);
 rect(400,0,100,600);
 rect(800,350,500,500);
 rect(1100,0,720,150);
 }
 
 /////////////// WORLD 2
 
 /////////////// WORLD 3
 
 /////////////// WORLD 4
 
}
// small world stuff
void stars() {
  //System.out.println(starCount);
 // star
 if (pos.x >= star0.x && pos.x <= star0.x+48 && pos.y >= star0.y && pos.y <= star0.y+48) {
   starCount++;
   star0.x = -100;
   star0.y= -100;
 }
}

void goals() {
 //goal
 fill(0,0,255);
 rect(goal.x,goal.y,32,32);
 /////////////// WORLD ADVANCE
 if (pos.x >= goal.x && pos.x <= goal.x+32 && pos.y >= goal.y && pos.y <= goal.y+32) {
   if (worldSpawned == 0) {
   worldSpawned = 1;
   worldSpawn();
   }
 }
 if (pos.x >= goal.x && pos.x <= goal.x+32 && pos.y >= goal.y && pos.y <= goal.y+32) {
   if (worldSpawned == 1) {
   worldSpawned = 2;
   }
 }
 
}

// extra
void grapple() {
   if(value) {
    
    rect(pos.x,pos.y,5,5);
    rect(mouseX,mouseY,20,20);
    if (sqrt((float)Math.pow(mouseX-pos.x,2) + (float)Math.pow(mouseY-pos.y,2)) < 20*7  &&
        sqrt((float)Math.pow(mouseX-pos.x,2) + (float)Math.pow(mouseY-pos.y,2)) > 10*5  ) {
      stroke(255,255,255);
      line(mouseX,mouseY,pos.x,pos.y);
      if (within(pos.x,mouseX,1) || within(mouseX,pos.x,1)) {
      pos.x += (mouseX-pos.x)/10;
        if (within(pos.x,mouseX,1)) {
        pos.x-=3;
      } if (within(mouseX,pos.x,1)) {
         pos.x+=3; 
         }
        
      }
      if (within(pos.y,mouseY,1) || within(mouseY,pos.y,1)) {
      pos.y -= (pos.y-mouseY)/20;
      } else if (Math.abs((mouseY-pos.y)) <= .5) {
        pos.y = mouseY;
      }
    }
  } 
}

Boolean within(float value, float value2, float tolerance) {
  if (value2-value <= tolerance || value-value2 >= tolerance*-1) {
    return true;
  } else {
    return false;
  }
}

// mouse
 void mousePressed() {
   value = true; 
 }
 
 void mouseReleased() {
   value = false;
 }
 
// keys 
 void keyPressed() {
   if(key == 'a') {
     moving = -walk;
   }
   if(key == 'd') {
     moving = walk;
   }
   if(key == ' ') {
     if(iscolliding) {
       vel.y -= 12;
     }
   }
   if(key =='r') {
     reset();
   }
 }
 void keyReleased() {
   if(key == 'a') {
     moving = 0;
   }
   if(key == 'd') {
     moving = 0;
   }
 }
