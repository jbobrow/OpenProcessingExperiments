
//Lee hye ri
//201420101

void setup(){

  size(600,600);

  background (35,224,232);

}

void smallSquares( float x, float y, float rectHeight, float rectWidth ){

  float i_num = 2;

  while (i_num < 600){

    float newRectHeight = rectHeight*random(5,10);

    float colorDecider = int(newRectHeight%4);

    if (colorDecider == 3){

      fill(95,242,182);

    } else if (colorDecider == 1){

      fill(444);

    } else if (colorDecider == 2){

      fill(222);

    } else {

      fill(355,34,67);

    }

    println (colorDecider); 

    //stroke(255);

    noStroke();

    rect(x + i_num, y,newRectHeight, rectWidth*random(10));

    i_num = i_num + 2;

  }

  

}

void squarePatternBuilder(){

  float i = 0;

  while (i < 100){

    translate(0,i);

    smallSquares(0,0,random(10,20),random(10,20));

    i++;

  }

}

void draw(){

  noLoop();

  squarePatternBuilder();

}
