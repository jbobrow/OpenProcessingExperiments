
PFont h=createFont("",1);void draw(){int c=#9C9CFF;stroke(c);fill(c*2);strokeWeight(50);rect(0,0,360,240);fill(c);textFont(h,11);text("READY.\n",40,50);fill(c*(millis()/250%2+1));text("▌",40,64);}

