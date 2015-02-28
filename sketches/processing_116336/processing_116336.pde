
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
      if (is_colliding(cx[i], cy[i])==true) {
        cw[i]=cw[i]+10; //the computer grows
        ch[i]=ch[i]+10;   
        cxs[i]+=0.1; //speeds up
        cys[i]+=0.1;
        fed.trigger();
        f=frameCount;
      }
      //before the computer explodes, display "5,4,3,2,1"
      for (int a=0; a<=4; a++) {
        if (frameCount>3000+60*a&&frameCount<3060+60*a&&ucn<N) {
          fill(255, 0, 0);
          textSize(50);
          text(5-a, 280, 300);
        }
      }
    }

    /*if a computer doesn't become an ultimate computer 
     and is alive for 1300 framecounts, game over*/
    if (frameCount==3300&&ucn<N) {
      lose.trigger();
    }
    if (frameCount>frame[i]+3300&&cw[i]>0&&cw[i]<120&&ucn<N) {
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
      fill(255, 255, 255, 25);
      ellipse(160, 450, 220, 220);
      ellipse(440, 430, 180, 180);
      fill(0, 220, 203);
      textSize(25);
      text("see your mission again", 170, 500, 180, 180);
      text("play again", 450, 485, 140, 140);

      for (int b=0;b<N;b++) {
        cxs[b]=0;
        cys[b]=0;
        cx[b]=-200;
      }
      scaler -= 0.01;
    }

    //the computer becomes an ultimate computer
    if (cw[i]==120) {
      ultimate.trigger();
      ucn++;      
      cx2[i]=cx[i];
      cy2[i]=cy[i];
      cw2[i]=140;
      cw2[i]=140;
      cx[i]=-200;
      cw[i]=0;
      ch[i]=0;
      oac=atan(cy2[i]/cx2[i])+PI;
      rc=sqrt(cx2[i]*cx2[i]+cy2[i]*cy2[i])-300*sqrt(2);
    }
    //if all 10 computers become ultimate computers than game ends
    if (ucn>N-1)
    { 
      image(daniel_win, 300, 220);

      if (frameCount==f) {
        win.trigger();
      }
      fill(255, 0, 0);
      textSize(40);
      text("Congratulations!", 80, 245);
      textSize(20);
      text("Enjoy your stay in Processing Galaxy!", 180, 275);
      scaler += 0.01;
      fill(255, 255, 255, 25);
      ellipse(160, 450, 220, 220);
      ellipse(440, 430, 180, 180);
      fill(0, 220, 203);
      textSize(25);
      text("see your mission again", 170, 500, 180, 180);
      text("play again", 450, 485, 140, 140);
    }
  }
}


