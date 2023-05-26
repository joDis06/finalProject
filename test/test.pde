float x,y;
float gravity,speed;
float size;
boolean[] keys;
boolean value;
double xVel,yVel;
PImage img;

void setup() {
  img = loadImage("pokemon.jpg");
  size(1240,860);
  frameRate(60);
  keys = new boolean[6];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  xVel = 0;
  x = width/2;
  y = 0;
  gravity = .1;
  speed = 0;
  size = 50;
  
  value = false;
  
  
}

void draw() {
  image(img, 0, 0);
  if (frameCount % 30 == 0) {
  System.out.println("Y level " + y);
  System.out.println("XVel" + xVel);
  }
  
  if (frameCount % 2 == 0) {
    if (xVel != 0) {
       if (Math.abs(xVel) < 50) {
       x += xVel;
       }
       if (xVel > 0) {
         xVel-=1;
       } else if (xVel < 0) {
         xVel+=1;
       }
    }
     
  }
  noStroke();
  //background(#DCE3E8);
  fill(255,0,0);
  
  if (within(y,600.0,.5) == false) {
  y = y + speed;
  speed = speed + gravity;
  }
  
  // spawn
  if (keys[4]) {
    spawn();
  }
  // reset
  if (keys[5]) {
    reset();
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == false) 
              && (keys[3] == false)) {
   if (within(y-10,y,5) == false) {
     
   y-=3; 
   }
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == false)) {
   y+=3; 
  }
  
  if (keys[2] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[3] == false)) {
   if (y == 600) {
     x-=5;
   } else {
   x-=2;
   xVel-=1;
   }
  }
  
  if (keys[3] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[2] == false)) {
   if (y == 600) {
     x+=5;
   } else {
   x+=2;
   xVel+=1;
   }
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   y-=3;
   x-=1;
   xVel-=1;
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   y-=5; 
   x+=1;
   xVel+=1;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   y+=3; 
   x-=1;
   xVel-=1;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   y+=3; 
   x+=1;
   xVel+=1;
  }
  
  //if (within(y,600,.1) == true && within(x,600,.1) == true) {
  //  y=600;
  // } else {
  gravityLol();
  // }
  
  if(value) {
    fill(0);
    rect(x,y,20,20);
    rect(mouseX,mouseY,20,20);
    if (sqrt((float)Math.pow(mouseX-x,2) + (float)Math.pow(mouseY-y,2)) < size*5 ) {
      stroke(120);
      line(mouseX,mouseY,x,y);
      if (within(x,mouseX,1) || within(mouseX,x,1)) {
      x += (mouseX-x)/25;
        if (within(x,mouseX,1)) {
        xVel-=2;
      } if (within(mouseX,x,1)) {
         xVel+=2; 
         }
        
      }
      if (within(y,mouseY,1) || within(mouseY,y,1)) {
      y -= (y-mouseY)/25;
      } else if (Math.abs((mouseY-y)) <= .5) {
        y = mouseY;
      }
    }
  }
  
  //if (within(y,600,60) == true && within(x,600,1) == true) {
  //  y=550;
  //  }
   
  fill(#F5D9F7);
  sillySquare();
  border();
  
}

void spawn() {
 rect(x,y,size,size);
}

void reset() {
 x = width/2;
 y = height/2;
 xVel = 0;
}

void keyPressed() {
  // spawn
      if (key=='p') {
      keys[4] = true;  
      }
  // reset 
      if (key=='r') {
      keys[5] = true;
      }  
  //
      if (key=='w') //0
        keys[0]=true;
      if (key=='s') //1
        keys[1]=true;
      if (key=='a') //2
        keys[2]=true;
      if (key=='d') //3
        keys[3]=true;  
      
    }
    
void keyReleased() {
  // reset
      if (key=='r') {
      keys[5] = false;
      }  
  //
  
      if (key=='w')
        keys[0]=false;
      if (key=='s')
        keys[1]=false;
      if (key=='a')
        keys[2]=false;
      if (key=='d')
        keys[3]=false; 
        
   } 
   
//

void gravityLol() {
 if (frameCount % 5 == 0 && y > 600) {
   speed = speed * -.35;
   y = 600;
 }
}
 
void mousePressed() {
  if (value == false) {
    value = true;
  } else {
    value = false;
  }
  
  
}
void mouseReleased() {
  if (value == true) {
    value = false;
  } else {
    value = true;
  }
}
  
Boolean within(float value, float value2, float tolerance) {
  if (value2-value <= tolerance || value-value2 >= tolerance*-1) {
    return true;
  } else {
    return false;
  }
}

void border() {
 if (y < 0) {
  y = 1; 
 } 
 if (x > 1190) {
  x=1190; 
 }
 if (x < 0) {
  x=0;
 }
}

  
void sillySquare() {
  rect(0,600+size,width,height/2);
  
  }
