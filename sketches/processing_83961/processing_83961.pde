
class Fallball {
//PImage injector;  

  float r = random(width);
  float fallRate = random (-height);

  void fall () {
    fallRate = fallRate + 3;
    fill(10, 200, 180);
//    ellipse(r, fallRate, 15, 15);
   tint(255,255);
    image(injector,r,fallRate,20,40);

    if (fallRate > height) {
//      for(int r=0;r<3; r++){
//      r=120*(r+1);
//      }
r=random(600);
      fallRate = random(-200);
    }


//    if (frameCount == 600) {
//      fallRate = fallRate + 2;
//    }
//    if (frameCount == 2000) {
//      fallRate = fallRate+ 3;
//    }
//
//    if (frameCount == 10000) {
//      fallRate = fallRate+ 3;
//    }
  }
//  
//    void gameFinish()
//  {
//   for (int i = 0; i < ball.length; i++)
//    {
//      if( fallRate >= height-15);
//      {
// 
//     
//        fill(color(255,0,0));
//     fill(255, 0, 0);
//    textAlign(CENTER);
//    text("GAME OVER", width/2, height/2);
//
//       
//     noLoop();
// 
//   
//       }
//      }
//    }

   

}



