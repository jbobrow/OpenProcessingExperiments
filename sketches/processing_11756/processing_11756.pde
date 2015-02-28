
void randomLocsSetup() {
  int r = int(random(0,2));
  println(r);
  for (int i=0;i<(randomLocs.length);i++) {
    randomLocs[i] = (r+i);
    if (random(xLocs.length/-5,xLocs.length*4/5) < 0) {
      randomLocs[i]=0;
    }
       
println(randomLocs[i]);
}

longerLine=randomLocs[int(random(randomLocs.length))];
shorterLine=randomLocs[int(random(randomLocs.length))];

  }


void drawRandomSpire() {
  fill(spireColor);
  noStroke();
  float r= random(1,maxHeight);
  rect(xLocs[randomSpire],height,maxHeight*10/r,r);
}


void someLines() {

  stroke(34,90,100,3);
  
    for (int i=0;i<randomLocs.length;i++) {
    strokeWeight(randomLocs[i]/strokeWeightFactor);
    if (randomLocs[i]>0.0) {
      if (randomLocs[i]==shorterLine) {
      line(0,randomLocs[i]*lineInterval,width-random(xLocs[randomSpire]-(width/10),xLocs[randomSpire]+(width/6)), randomLocs[i]*lineInterval);
    }
    else {
      line(0,randomLocs[i]*lineInterval,width-random(xLocs[randomSpire]-(width/4),xLocs[randomSpire]+(width/3)), randomLocs[i]*lineInterval);
    
    if (randomLocs[i]==longerLine) {
      line(0,randomLocs[i]*lineInterval,width-random(xLocs[randomSpire]-(width/2),xLocs[randomSpire]+(width)), randomLocs[i]*lineInterval);
    }
    }
    
   


  }
}
}

