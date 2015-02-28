

class Bacteria{
  float spawn;

  Bacteria(float tempbx, float tempby, float tempbspeed){
    bx = tempbx;
    by = tempby;
    tempbspeed = bspeed;
  }
  void restart(){
    spawn = round(random(0, 1));
    if(spawn == 0){
      bx = round(random(0, 1)) * width;
      by = random(0, height);
    } 
    else {
      if(spawn == 1){
        by = round(random(0, 1)) * height;
        bx = random(0, width);
      }
    }
  }

  void update(){
    bx += random(-1, 1);
    if (bx > width){
      bx = width;
      bactR += PI;
    }
    if (bx < 0){
      bx = 0;
      bactR += PI;
    }
    by += random(-1, 1);
    if (by > height){
      by = height;
      bactR += PI;
    }
    if (by < 0){
      by = 0;
      bactR += PI;
    }
    bspeed = 1;
    //collision
    if((dist(cx,cy, bx,by) < diameter/2) && (death == 0)){
      eat = true;
    }
    if(eat == true){
      level ++;
      bAlpha = 0;
      spawn = round(random(0, 1));
      if(spawn == 0){
        bx = round(random(0, 1)) * width;
        by = random(0, height);
      } 
      else {
        if(spawn == 1){
          by = round(random(0, 1)) * height;
          bx = random(0, width);
        }
      }
      eat = false;
    }
    if(bAlpha < 100){
      bAlpha ++;
    }
    pushMatrix();
    bactR += random(-.3, .3);
    bx += cos(bactR) * bspeed;
    by += sin(bactR) * bspeed;
    translate(bx, by);
    rotate(bactR);
    strokeWeight(3);
    stroke(0, bAlpha);
    fill(180, 93, 73, bAlpha);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}



