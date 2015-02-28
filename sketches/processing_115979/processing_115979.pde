
void comp() {
  for (i=0;i<N;i++) {

    //when the computer exists
    if (cw[i]<120) { //before it becomes an ultimate coputer
      fill(255);
      noStroke();
      imageMode(CENTER);
      image(images[i], cx[i], cy[i], cw[i], ch[i]); 
      //move the computer
      cx[i]+=cxs[i];
      cy[i]+=cys[i];
      //ensure the computer's position within the window
      if (cx[i]<=cw[i]/2||cx[i]>width-cw[i]/2) {
        cxs[i]=-cxs[i];
      }
      if (cy[i]<=ch[i]/2||cy[i]>450-ch[i]/2) {
        cys[i]=-cys[i];
      }
      //when the computer is fed
      if (is_colliding(cx[i],cy[i])==true) {
        cw[i]=cw[i]+10; //the computer grows
        ch[i]=ch[i]+10;   
        cxs[i]+=0.1; //speeds up
        cys[i]+=0.1;
        fed.trigger();
        f=frameCount;
      }
      //before the computer explodes, display "5,4,3,2,1"
      for (int a=0; a<=4; a++) {
        if (frameCount>1500+60*a&&frameCount<1560+60*a&&ucn<N) {
          fill(255, 0, 0);
          textSize(50);
          text(5-a, 280, 300);
        }
      }
    }

    /*if a computer doesn't become an ultimate computer 
     and is alive for 1300 framecounts, game over*/
    if(frameCount==1800&&ucn<N) {
    lose.trigger();  
    }
    if (frameCount>frame[i]+1800&&cw[i]>0&&cw[i]<120&&ucn<N) {
      for ( int i = 0; i< daniel_sad.length-1; i++ )
      {
        if (frameCount%13==i+1) {
          image(daniel_sad[i], 400, 150);
        }
        if (frameCount%13==0) {
          image(daniel_sad[12], 400, 150);
        }
      } 
         
      fill(255, 0, 0);
      textSize(50);
      text("Game Over!", 150, 290 );
      textSize(20);
      text("Press A to earn your chance back to Processing Galaxy!", 35, 340);
      text("Press B to See your mission again.", 120, 370);
      for (int b=0;b<N;b++) {
        cxs[b]=0;
        cys[b]=0;
        cx[b]=-200;
      }
      scaler -= 0.01;
    }
    //the computer becomes an ultimate computer
    if (cw[i]==120) {
      ucn++;
      cx2[i]=cx[i];
      cy2[i]=cy[i];
      cw2[i]=140;
      cw2[i]=140;
      cx[i]=-200;
      cw[i]=0;
      ch[i]=0;
    }
    //if all 10 computers become ultimate computers than game ends
    if (ucn>N-1)
    { image(daniel_win,300,220);
      
       if (frameCount==f) {win.trigger();
     }
      fill(255, 0, 0);
      textSize(40);
      text("Congratulations!", 80, 415);
      textSize(20);
      text("Enjoy your stay in Processing Galaxy!", 180, 465);
      text("Press A to start again.", 180, 500);
      scaler += 0.01;
    }
  }
}


