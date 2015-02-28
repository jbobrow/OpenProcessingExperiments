
float time = 0;

void setup() {
  frameRate(15);
  size (1920, 1080);
  background(0);
  smooth();
}

void draw() {
  fill(0, 150);
  rect(0, 0, width, height);

  float x = 0;

  while (x <width) {

    //main line
    strokeWeight(5);

//green---------------------------------
    if (key == 'g') {
      stroke(#08FF22);
    }
    

//red------------------------------------
    if (key == 'r') {
      stroke(#FF0F03);
    }
   

//blue-----------------------------------

if (key == 'b') {
      stroke(#033BFF);
    }
    
//yellow--------------------------------
if (key == 'y') {
      stroke(#FFF703);
    }
    
//purple--------------------------------
if (key == 'p') {
      stroke(#F203FF);
    }
//grayscale-----------------------------
if (key == 'w') {
      stroke(255);
    }
//orange--------------------------------
if (key == 'o') {
      stroke(#FA8508);
    }

    point(x, height*noise(x/100, time));
////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////


//SECOND LINE
    strokeWeight(5);
    
    //green---------------------------------
    if (key == 'g') {
      stroke(#02BC12);
    }
    

//red------------------------------------
    if (key == 'r') {
      stroke(#930601);
    }
   

//blue-----------------------------------

if (key == 'b') {
      stroke(#062EB9);
    }
    
//yellow--------------------------------
if (key == 'y') {
      stroke(#B7AE04);
    }
    
//purple--------------------------------
if (key == 'p') {
      stroke(#AD04B7);
    }
//grayscale-----------------------------
if (key == 'w') {
      stroke(#C4C4C4);
    }
//orange--------------------------------
if (key == 'o') {
      stroke(#C46302);
    }
    point(x, height*noise(x/101, time));
/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////






//3rd Line...
    strokeWeight(5);
    
     //green---------------------------------
    if (key == 'g') {
      stroke(#017E0A);
    }
    

//red------------------------------------
    if (key == 'r') {
      stroke(#6F0400);
    }
   

//blue-----------------------------------

if (key == 'b') {
      stroke(#011A6A);
    }
    
//yellow--------------------------------
if (key == 'y') {
      stroke(#B7AE04);
    }
    
//purple--------------------------------
if (key == 'p') {
      stroke(#AD04B7);
    }
//grayscale-----------------------------
if (key == 'w') {
      stroke(#C4C4C4);
    }
//orange--------------------------------
if (key == 'o') {
      stroke(#C46302);
   
    point(x, height*noise(x/102, time));
}
////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
////////////////////////////////////////////////////////


//FINAL LINE

    strokeWeight(5);
    
    
    
    stroke(#03430A);
    point(x, height*noise(x/103, time));

    x= x + 1;
  }
  time = time + 0.05;




  strokeWeight(5);
  stroke(255, 0, 250);
  point(x, height*noise(x/104, time));

  }


