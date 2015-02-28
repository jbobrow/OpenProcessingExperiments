
PFont font;

int w = 400;
int h = 200;

void setup(){
  size (440,200);
  smooth();
  font = loadFont("Futura-CondensedExtraBold-100.vlw");
  textFont(font);
}

void draw(){
  background(25);
  int s = second();
  int m = minute();
  int h = hour();
  int now = h * 60 + m;
  int next = 0;
  int last = 0;
  println(h + ":" + m + ":" + s);
  println("now is now: " + now);
  //00:00 to 00:12
  if(now <= 12){
    last = 0 * 60 +0;
    next = 0 * 60 +12;
  }

  //00:13 to 1:11
  else if(now > 12 && now <= 71){
    last = 0 * 60 + 12;
    next = 1 * 60 + 11;
  }

  //1:12 to 2:22
  else if(now > 71 && now <= 142){
    last = 1 * 60 + 11;
    next = 2 * 60 + 22;
  }

  //2:23 to 3:33
  else if(now > 142 && now <= 213){
    last = 2 * 60 + 22;
    next = 3 * 60 + 33;
  }

  //3:34 to 4:44
  else if(now > 213 && now <= 284){
    last = 3 * 60 + 33;
    next = 34 * 60 + 44;
  }

  //4:45 to 5:55
  else if(now > 284 && now <= 355){
    last = 4 * 60 + 44;
    next = 5 * 60 + 55;
  }

  //5:56 to 10:10
  else if(now > 355 && now <= 610){
    last = 5 * 60 + 55;
    next = 10 * 60 + 10;  
  }  

  //10:11 to 11:11
  else if(now > 610 && now <= 671){
    last = 10 * 60 + 10;
    next = 11 * 60 + 11;
  }

  //11:12 to 12:12
  else if(now > 671 && now <= 732){
    last = 11 * 60 + 11;
    next = 12 * 60 + 12;
  }

  //12:13 to 13:11
  else if(now > 732 && now <= 791){
    last = 12 * 60 + 12;
    next = 13 * 60 + 11;
  }

  //13:12 to 14:22
  else if(now > 791 && now <= 862){
    last = 13 * 60 + 11;
    next = 14 * 60 + 22;
  }

  //14:23 to 15:33
  else if(now > 862 && now <= 933){
    last = 14 * 60 + 22;
    next = 15 * 60 + 33;
  }

  //15:34 to 16:44
  else if(now > 933 && now <= 1004){
    last = 15 * 60 + 33;
    next = 16 * 60 + 44;
  }

  //16:45 to 17:55
  else if(now > 1004 && now <= 1075){
    last = 16 * 60 + 44;
    next = 17 * 60 + 55;
  }

  //17:56 to 22:10
  else if(now > 1075 &&  now <= 1330){
    last = 17 * 60 + 55;
    next = 22 * 60 + 10;
  }

  //22:11 to 23:11
  else if(now > 1330 && now <= 1391){
    last = 22 * 60 + 10;
    next = 23 * 60 + 11;
  }

  //23:12 to 24:12
  else if(now > 1391 && now <= 1452){
    last = 23 * 60 + 11;
    next = 24 * 60 + 12;
  }

  //24:13 to 24:59
  else if(now > 1452 && now <= 1500){
    last = 24 * 60 + 12;
    next = 24 * 60 + 59;
  }

  //set curve for excitement acceleration
  noFill();
  noStroke();
  // bezier(0,0,0,0,440,0,440,200);
  //for (int k= last; k <= next; k++){
  float t = map(now, last, next, 0, 1);
  float y = bezierPoint(0,0,0,200, t);

  println("Time: "+t +" should never be > 1\n y: " +y);
  println("now: " + now + "\nlast:" + last + "\nnext:"+ next);

  //background(0);
  //excited background  

  println(width + ":"+ height);
  for(int i = 0; i < width; i+=20){
    for(int j = 0; j < height; j+=20){
      float randSize = random(map(y, 0, 200, 1, 100));
      noStroke();
      int controlAlpha = int(map(y, 0, 200, 30, 200));
      fill(200, controlAlpha+10);
      float randX = random(map(y, 0, 200, 3, 50));
      float randY = random(map(y, 0, 200, 3, 50));
      //ellipse(i + rand03, j + rand03, y/rand01, y/rand01);
      ellipse(i + randX, j + randY, (randSize/2)+7, (randSize/2)+7);
      fill(255, controlAlpha+10);
      ellipse(i-randX+20, j-randY+20, (randSize/10)+2, (randSize/10)+2);
      fill(100, controlAlpha+10);
      ellipse(i-randY+20, j-randX+20, (randSize/5)+5, (randSize/5)+5);


    }
  }

  //}

  // telling time
  fill(y*2);
  if (h > 12) {
    h -= 12;
  }
  if(h < 1){
    h = 12;
  }
  textMode(SCREEN);
  textAlign(CENTER);
  textSize(100);
  String time = nf(h,1)+":"+ nf(m,2);
  text(time,width/2,height-50);

}




