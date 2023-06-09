class Platform {
  PVector Rpos;
  int Len;
  int Height = 5;
  
  
  Platform(float x, float y, int len) {
    Rpos = new PVector(x, y);
    Len = len;
  }
  
void show() {
    stroke(#BCB5BF);
    rect(Rpos.x,Rpos.y,Len,Height);
    //fill(0);
    //rect(pos.x, pos.y, 50, 200);
  }
  
boolean collide(PVector p) {
    PVector playerTopLeft = new PVector(p.x,p.y);
    PVector playerTopRight = new PVector(p.x+64,p.y);
    PVector playerBottomLeft= new PVector(p.x,p.y+64);
    PVector playerBottomRight = new PVector(p.x+64,p.y+64);
    
    PVector boxTopLeft = new PVector(Rpos.x, Rpos.y);
    PVector boxTopRight = new PVector(Rpos.y + Len,Rpos.y);
    PVector boxBottomLeft = new PVector(Rpos.x, Rpos.y + Height);
    PVector boxBottomRight = new PVector(Rpos.x + Len,Rpos.y + Height);
    if(p.x > Rpos.x && p.y > Rpos.y && p.x < Rpos.x+Len && p.y < Rpos.y+Height) {
     return true;
    }
    //if ( (playerTopRight.x < boxBottomLeft.x) &&
    // (playerBottomLeft.x > boxTopRight.x) &&
    // (playerTopRight.y > boxBottomLeft.y) &&
    // (playerBottomLeft.y >  boxTopRight.y)) {
    //  return true;
    //}
    else {
    return false;
    }
  }
}
