// variables
float x,y,floor,gravity,speed,size;
boolean[] keys;
boolean value;
double xVel,yVel;
PImage img;

// class
public class Game {
  
  // constructor
  public Game() {
    x = width/2;
    y = height/2;
    floor = width/4;
    size = 25;
  }  

// game methods
  // background
void gameBackLoad() {
  img = loadImage("gameBack.jpg");
}

void gameBackPlace() {
 image(img,0,0); 
}

  // world
void gameWorld() {
 border();
 Floor();
}
  
void border() {
 if (y < height/2)  y = height/2;  
 if (y > height-280-size) y = height-280-size;
 if (x > width-size)  x = width-size; 
 if (x < 0)  x = 0; 
}

void Floor() {
  fill(0,122,0);
  rect(0, height-280, width, height/4);
}

void reset() {
 x = width/2;
 y = height/2;
}

  // keys
void keyPressing() {  
 if (key == 'w' &&
     keyPressed == true) {
  up();
 }
 if (key == 's' &&
     keyPressed == true) {
  down();
 }
 if (key == 'a' &&
     keyPressed == true) {
  left();
 }
 if (key == 'd' &&
     keyPressed == true) {
  right();
 }
 
 if (key == 'r' &&
     keyPressed == true) {
  reset();      
 }
}

  // char
void spawn() {
 fill(255,0,0);
 rect(x,y,size,size);
}

  // movement
void up() {
  y -= size; 
}

void down() {
  y += size; 
}

void left() {
  x -= size;
}

void right() {
  x += size; 
}

//  keys = new boolean[6];
//  keys[0] = false;
//  keys[1] = false;
//  keys[2] = false;
//  keys[3] = false;
//  keys[4] = false;
//  xVel = 0;
//  x = width/2;
//  y = 0;
//  gravity = .1;
//  speed = 0;
//  size = 25;
//  floor = 800;
  
//  value = false;
  
  
//}

//void draw() {
//  image(img, 0, 0);
//  if (frameCount % 30 == 0) {
//  System.out.println("Y level " + y);
//  System.out.println("XVel" + xVel);
//  }
  
//  if (frameCount % 1 == 0) {
//    if (xVel != 0) {
//       if (Math.abs(xVel) < 50) {
//       x += xVel;
//       }
//       if (xVel > 0) {
//         xVel-=1;
//       } else if (xVel < 0) {
//         xVel+=1;
//       }
//    }
     
//  }
//  noStroke();
//  //background(#DCE3E8);
//  fill(255,0,0);
  
//  if (within(y,floor,.5) == false) {
//  y = y + speed;
//  speed = speed + gravity;
//  }
  
//  // spawn
//  if (keys[4]) {
//    spawn();
//  }
//  // reset
//  if (keys[5]) {
//    reset();
//  }
  
//  if (keys[0] && (keys[1] == false) 
//              && (keys[2] == false) 
//              && (keys[3] == false)) {
//   if (within(y-10,y,5) == false) {
     
//   y-=3; 
//   }
//  }
  
//  if (keys[1] && (keys[0] == false) 
//              && (keys[2] == false) 
//              && (keys[3] == false)) {
//   y+=3; 
//  }
  
//  if (keys[2] && (keys[0] == false) 
//              && (keys[1] == false) 
//              && (keys[3] == false)) {
//   if (y == floor) {
//     x-=5;
//   } else {
//   x-=2;
//   xVel-=1;
//   }
//  }
  
//  if (keys[3] && (keys[0] == false) 
//              && (keys[1] == false) 
//              && (keys[2] == false)) {
//   if (y == floor) {
//     x+=5;
//   } else {
//   x+=2;
//   xVel+=1;
//   }
//  }
  
//  if (keys[0] && (keys[1] == false) 
//              && (keys[2] == true) 
//              && (keys[3] == false)) {
//   y-=3;
//   x-=1;
//   xVel-=1;
//  }
  
//  if (keys[0] && (keys[1] == false) 
//              && (keys[2] == false) 
//              && (keys[3] == true)) {
//   y-=5; 
//   x+=1;
//   xVel+=1;
//  }
  
//  if (keys[1] && (keys[0] == false) 
//              && (keys[2] == true) 
//              && (keys[3] == false)) {
//   y+=3; 
//   x-=1;
//   xVel-=1;
//  }
  
//  if (keys[1] && (keys[0] == false) 
//              && (keys[2] == false) 
//              && (keys[3] == true)) {
//   y+=3; 
//   x+=1;
//   xVel+=1;
//  }
  
//  //if (within(y,floor,.1) == true && within(x,floor,.1) == true) {
//  //  y=floor;
//  // } else {
//  gravityLol();
//  // }
  
//  if(value) {
//    fill(0);
//    rect(x,y,20,20);
//    rect(mouseX,mouseY,20,20);
//    if (sqrt((float)Math.pow(mouseX-x,2) + (float)Math.pow(mouseY-y,2)) < size*5 ) {
//      stroke(120);
//      line(mouseX,mouseY,x,y);
//      if (within(x,mouseX,1) || within(mouseX,x,1)) {
//      x += (mouseX-x)/25;
//        if (within(x,mouseX,1)) {
//        xVel-=2;
//      } if (within(mouseX,x,1)) {
//         xVel+=2; 
//         }
        
//      }
//      if (within(y,mouseY,1) || within(mouseY,y,1)) {
//      y -= (y-mouseY)/25;
//      } else if (Math.abs((mouseY-y)) <= .5) {
//        y = mouseY;
//      }
//    }
//  }
  
//  //if (within(y,floor,60) == true && within(x,floor,1) == true) {
//  //  y=550;
//  //  }
   
//  fill(#F5D9F7);
//  sillySquare();
//  border();
  
//}

//void spawn() {
// rect(x,y,size,size);
//}

//void reset() {
// x = width/2;
// y = height/2;
// xVel = 0;
//}

//void keyPressed() {
//  // spawn
//      if (key=='p') {
//      keys[4] = true;  
//      }
//  // reset 
//      if (key=='r') {
//      keys[5] = true;
//      }  
//  //
//      if (key=='w') //0
//        keys[0]=true;
//      if (key=='s') //1
//        keys[1]=true;
//      if (key=='a') //2
//        keys[2]=true;
//      if (key=='d') //3
//        keys[3]=true;  
      
//    }
    
//void keyReleased() {
//  // reset
//      if (key=='r') {
//      keys[5] = false;
//      }  
//  //
  
//      if (key=='w')
//        keys[0]=false;
//      if (key=='s')
//        keys[1]=false;
//      if (key=='a')
//        keys[2]=false;
//      if (key=='d')
//        keys[3]=false; 
        
//   } 
   
////

//void gravityLol() {
// if (frameCount % 5 == 0 && y > floor) {
//   speed = speed * -.35;
//   y = floor;
// }
//}
 
//void mousePressed() {
//  if (value == false) {
//    value = true;
//  } else {
//    value = false;
//  }
  
  
//}
//void mouseReleased() {
//  if (value == true) {
//    value = false;
//  } else {
//    value = true;
//  }
//}
  
//Boolean within(float value, float value2, float tolerance) {
//  if (value2-value <= tolerance || value-value2 >= tolerance*-1) {
//    return true;
//  } else {
//    return false;
//  }
//}

//void border() {
// if (y < 0) {
//  y = 1; 
// } 
// if (x > width-size) {
//  x=width-size; 
// }
// if (x < 0) {
//  x=0;
// }
//}

  
//void sillySquare() {
//  rect(0,floor+size,width,height/4);
  
//  }
}
