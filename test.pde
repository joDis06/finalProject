float x,y;
float gravity,speed;
boolean[] keys;
boolean value;
double xVel,yVel;

void setup() {
  size(800,800);
  frameRate(60);
  keys = new boolean[6];
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  x = width/2;
  y = 0;
  gravity = .1;
  speed = 0;
  
  value = false;
  
  
}

void draw() {
  if (frameCount % 30 == 0) {
  System.out.println("Y level " + y);
  }
  noStroke();
  background(#DCE3E8);
  fill(0,122,0);
  
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
     
   y-=5; 
   }
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == false)) {
   y+=5; 
  }
  
  if (keys[2] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[3] == false)) {
   x-=5; 
  }
  
  if (keys[3] && (keys[0] == false) 
              && (keys[1] == false) 
              && (keys[2] == false)) {
   x+=5; 
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   y-=5;
   x-=2.5;
  }
  
  if (keys[0] && (keys[1] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   y-=5; 
   x+=5;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == true) 
              && (keys[3] == false)) {
   y+=5; 
   x-=5;
  }
  
  if (keys[1] && (keys[0] == false) 
              && (keys[2] == false) 
              && (keys[3] == true)) {
   y+=5; 
   x+=5;
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
    if (sqrt((float)Math.pow(mouseX-x,2) + (float)Math.pow(mouseY-y,2)) < 250 ) {
      stroke(120);
      line(mouseX,mouseY,x,y);
      if (within(x,mouseX,1) == true || within(mouseX,x,1)) {
      x += (mouseX-x)/20;
      }
      if (within(y,mouseY,1) == true || within(mouseY,y,1)) {
      y -= (y-mouseY)/30;
      }
    }
  }
  
  //if (within(y,600,60) == true && within(x,600,1) == true) {
  //  y=550;
  //  }
   
  fill(#F5D9F7);
  sillySquare();
  
}

void spawn() {
 rect(x,y,50,50);
}

void reset() {
 x = width/2;
 y = height/2;
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

  
void sillySquare() {
  rect(0,650,800,200);
  
  }
