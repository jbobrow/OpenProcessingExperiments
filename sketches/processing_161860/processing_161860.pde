
int xPos = 23; 
int yPos = 50;
int bSize = 25;
int pSize = 40;
int ppSize = 50;

void setup(){
size(800,800);
background(#FFFFFF);

//color area
noStroke();
fill(#DEDEDE);
rect(0, 0, 150, 800);

//red
fill(#FFB4BC);
rect(xPos,yPos,bSize,bSize);

fill(#FF6776);
rect(xPos,yPos+bSize+3,bSize,bSize);

fill(#FF001A);
rect(xPos,yPos+bSize*2+3*2,bSize,bSize);


//orange
fill(#FFE0B9);
rect(xPos+pSize,yPos,bSize,bSize);

fill(#FFB55A);
rect(xPos+pSize,yPos+bSize+3,bSize,bSize);

fill(#FF8D00);
rect(xPos+pSize,yPos+bSize*2+3*2,bSize,bSize);

//yellow
fill(#FFFDAF);
rect(xPos+pSize*2,yPos,bSize,bSize);

fill(#FFFA5D);
rect(xPos+pSize*2,yPos+bSize+3,bSize,bSize);

fill(#FFD900);
rect(xPos+pSize*2,yPos+bSize*2+3*2,bSize,bSize);

 
 
//green  
fill(#AAFFD9);
rect(xPos,yPos+bSize*2+ppSize,bSize,bSize);

fill(#50E8A4);
rect(xPos,yPos+bSize*3+ppSize+3,bSize,bSize);

fill(#00C66E);
rect(xPos,yPos+bSize*4+ppSize+3*2,bSize,bSize);



//blue
fill(#BFDEFF);
rect(xPos+pSize,yPos+bSize*2+ppSize,bSize,bSize);

fill(#5DACFF);
rect(xPos+pSize,yPos+bSize*3+ppSize+3,bSize,bSize);

fill(#0075F0);
rect(xPos+pSize,yPos+bSize*4+ppSize+3*2,bSize,bSize);


//purple
fill(#FBC1FF);
rect(xPos+pSize*2,yPos+bSize*2+ppSize,bSize,bSize);

fill(#F45AFF);
rect(xPos+pSize*2,yPos+bSize*3+ppSize+3,bSize,bSize);

fill(#C000CE);
rect(xPos+pSize*2,yPos+bSize*4+ppSize+3*2,bSize,bSize);


//erase
fill(#FFFFFF);
rect(xPos,yPos+yPos*13,bSize*3+30,bSize*2+3);

}

void draw(){

if (mousePressed) {
  //brush area
  
  if (790 > pmouseX && 790 > mouseX && pmouseX > 180 && mouseX > 180 && 
      790 > pmouseY && 790 > mouseY && pmouseY> 10 && mouseY> 10) {
      
        line(pmouseX, pmouseY, mouseX, mouseY);
    }

//red one
 if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(#FFB4BC);
      strokeWeight(5);
    }
//two
if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize+3 && mouseY <yPos+bSize+3+bSize) {
      stroke(#FF6776);
      strokeWeight(5);
    }
//three
if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2+3*2 && mouseY <yPos+bSize*2+3*2+bSize) {
      stroke(#FF001A);
      strokeWeight(5);
   }
   
  
  //orange one
 if ( mouseX > xPos+pSize && mouseX < xPos+pSize+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(#FFE0B9);
      strokeWeight(5);
    }
//two
if ( mouseX > xPos+pSize && mouseX <xPos+pSize+bSize && mouseY > yPos+bSize+3 && mouseY <yPos+bSize+3+bSize) {
      stroke(#FFB55A);
      strokeWeight(5);
    }
//three
if ( mouseX > xPos+pSize && mouseX < xPos+pSize+bSize && mouseY > yPos+bSize*2+3*2 && mouseY <yPos+bSize*2+3*2+bSize) {
      stroke(#FF8D00);
      strokeWeight(5);
   }
   
   
  
   //yellow one
 if ( mouseX > xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY > yPos && mouseY <yPos+bSize) {
      stroke(#FFFDAF);
      strokeWeight(5);
    }

//two
if ( mouseX > xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY > yPos+bSize+3 && mouseY <yPos+bSize+3+bSize) {
      stroke(#FFFA5D);
      strokeWeight(5);
    }

//three
if ( mouseX > xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY > yPos+bSize*2+3*2 && mouseY <yPos+bSize*2+3*2+bSize) {
      stroke(#FFD900);
      strokeWeight(5);
   }



   //green one
 if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2+ppSize && mouseY <yPos+bSize*2+ppSize+bSize) {
      stroke(#AAFFD9);
      strokeWeight(5);
    }

//two
if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2+ppSize+bSize+3 && mouseY <yPos+bSize*2+ppSize+bSize+3+bSize) {
      stroke(#50E8A4);
      strokeWeight(5);
    }

//three
if ( mouseX > xPos && mouseX < xPos+bSize && mouseY > yPos+bSize*2+ppSize+bSize*2+3*2 && mouseY <yPos+bSize*2+ppSize+bSize*2+3*2+bSize) {
      stroke(#00C66E);
      strokeWeight(5);
   }
   

 //blue one
 if ( mouseX > xPos+pSize && mouseX < xPos+pSize+bSize && mouseY > yPos+bSize*2+ppSize && mouseY <yPos+bSize*2+ppSize+bSize) {
      stroke(#BFDEFF);
      strokeWeight(5);
    }

//two
if ( mouseX > xPos+pSize && mouseX < xPos+pSize+bSize && mouseY >  yPos+bSize*2+ppSize+bSize+3 && mouseY <yPos+bSize*2+ppSize+bSize+3+bSize) {
      stroke(#5DACFF);
      strokeWeight(5);
    }

//three
if ( mouseX > xPos+pSize && mouseX <xPos+pSize+bSize && mouseY > yPos+bSize*2+ppSize+bSize*2+3*2 && mouseY < yPos+bSize*2+ppSize+bSize*2+3*2+bSize) {
      stroke(#0075F0);
      strokeWeight(5);
   }
   
   
   
    //purple one
 if ( mouseX >xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY >  yPos+bSize*2+ppSize && mouseY < yPos+bSize*2+ppSize+bSize) {
      stroke(#FBC1FF);
      strokeWeight(5);
    }

//two
if ( mouseX > xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY >  yPos+bSize*2+ppSize+bSize+3 && mouseY < yPos+bSize*2+ppSize+bSize+3+bSize) {
      stroke(#F45AFF);
      strokeWeight(5);
    }

//three
if ( mouseX > xPos+pSize*2 && mouseX < xPos+pSize*2+bSize && mouseY >  yPos+bSize*2+ppSize+bSize*2+3*2 && mouseY < yPos+bSize*2+ppSize+bSize*2+3*2+bSize) {
      stroke(#C000CE);
      strokeWeight(5);
   }

//erase
if ( mouseX > xPos && mouseX < xPos+bSize*3+30 && mouseY >  yPos+yPos*13 && mouseY < yPos+yPos*13+bSize*2+3) {
      stroke(#FFFFFF);
      strokeWeight(50);
      
      //xPos,yPos+yPos*13,bSize*3+30,bSize*2+3
      
      
   }

}
}


