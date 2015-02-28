
/*
* Lab 3- Mandala
* By: Aaron Evans
* September 15th, 2010
*/


color fc1 = color(115,131,126,50);
color fc2 = color(73,195,100,50);
color fc3 = color(73,195,100,50);
color sc = (0);

void setup(){
  size(800,800);
  background(100);
  smooth();
  noStroke();
  fill(fc2);
  ellipse(width/2, height/2,800,800);
  

  PVector v= new PVector(width/2, height/2);
  whurgFunction(v,800,800);

  for(int i=0; i < 5; i++){
    noStroke();
 //polyStar(float x,float y,int pts,float outerRad,float innerRad,color fillCol,color strokeCol, float strokeWt, float theta)
   polyStar(width/2,height/2, 12   ,400           , 270          , fc1         , sc            , 0              , PI/i    );
   polyStar(width/2,height/2, 6    ,300           , 190          , fc2         , sc            , 0               , PI/i    );
   polyStar(width/2,height/2, 6    ,190           , 300          , fc1         , sc            , 0               , PI/i    );
   polyStar(width/2,height/2, 3    ,150           , 95           , fc2         , sc            , 0               , PI/i    );
   polyStar(width/2,height/2, 3    ,95            , 150          , fc1         , sc            , 0             , PI/i    );
   polyStar(width/2,height/2, 19  ,25            , 50           , fc3         , sc            , 0               , PI/i    );
   
} 
}

