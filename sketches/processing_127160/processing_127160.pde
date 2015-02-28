
void movement() {
  if(keyPressed){
    if(key=='w')body[0].direction='u';
    if(key=='s')body[0].direction='d';
    if(key=='a')body[0].direction='l';
    if(key=='d')body[0].direction='r';
  }
//  if (key==CODED) {
//    if (keyPressed==false) {
//      if (keyCode==UP&&body[0].y>=20) {
//        body[0].y-=20;
//        keyCode=SHIFT;
//      }
//    }
//  }
//  if (key==CODED) {
//    if (keyPressed==false) {
//      if (keyCode==LEFT&&body[0].x>=20) {
//        body[0].x-=20;
//        keyCode=SHIFT;
//      }
//    }
//  }
//  if (key==CODED) {
//    if (keyPressed==false) {
//      if (keyCode==DOWN&&body[0].y<380) {
//        body[0].y+=20;
//        keyCode=SHIFT;
//      }
//    }
//  }
//  if (key==CODED) {
//    if (keyPressed==false) {
//      if (keyCode==RIGHT&&body[0].x<380) {
//        body[0].x+=20;
//        keyCode=SHIFT;
//      }
//    }
//  }
}


