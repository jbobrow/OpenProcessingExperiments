
color[] colorOptions = new color[5];
colorOptions[0] = #ff0033;
colorOptions[1] = color(150,0,0);
colorOptions[2] = color(0,150,0);
colorOptions[3] = color(0,0,150);
colorOptions[4] = #FFFF00;

//color[] colorOptions = {#ff0033, color(150,0,0), color(0,150,0), color(0,0,150), #FFFF00, #00FFFF, color(0),color(255)};
int arrayLength = colorOptions.length;

color lastItem = colorOptions[colorOptions.length-1];

size(400,400);

//fill(colorOptions[0]);
//rect(0, 0, width/arrayLength,height/arrayLength);
//
//fill(colorOptions[1]);
//rect(width/arrayLength,height/arrayLength,width/arrayLength,height/arrayLength);
//
//fill(colorOptions[2]);
//rect(2*width/arrayLength,2*height/arrayLength,width/arrayLength,height/arrayLength);
//
//fill(colorOptions[3]);
//rect(3*width/arrayLength,3*height/arrayLength,width/arrayLength,height/arrayLength);
//
//fill(colorOptions[4]);
//rect(4*width/arrayLength,4*height/arrayLength,width/arrayLength,height/arrayLength);


for(int i=0; i<arrayLength; i++){
  fill(colorOptions[i]);
  rect(i*width/arrayLength,i*height/arrayLength,width/arrayLength,height/arrayLength);
}



println(colorOptions.length);

