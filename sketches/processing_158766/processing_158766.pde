
color[] blues1 = {#00bae5, #2f79ff, #74d1ff, #13a3f7, #006eeb, #003380};
color[] blues2 = {#6155ff, #8582ff, #4d00f7, #6924ff, #7466ff, #351280};
color[] greens = {#009b42, #72c900, #0ab300, #9ed927, #008a46, #004d26};
color[] oranges = {#f7b81c, #ffdd00, #ff8b00, #ff4f00, #f67d00, #802200};
color[] reds = {#f50a24, #d5000e, #ff574d, #ff574d, #ed1429, #800009};
color[] pinks = {#e83d56, #f74179, #e63262, #cd007f, #f94e91, #800046};
color[] purples = {#5f189e, #8c3db8, #a83ac5, #a352cc, #6d3cc5, #511273};
color[] colors[] = {blues1, greens, oranges, reds, pinks, purples, blues2, blues1, greens, oranges, reds};
int[] widths = {196, 158, 118, 174, 132, 106, 184, 120, 192, 98, 122};
int[] xwidths = new int[widths.length];
int whichColor;
color fillcol, localColor; 
int triDir; //triangle? and if so, which way?
float x, w;
float y, h, localWidth;
int prevX;
//int alph = 255;

void setup(){
  size(1024, 768);
  background(0);
  prevX = 0;
  for(int z=0; z<widths.length; z++){
    xwidths[z] = prevX;
    prevX = prevX + floor(widths[z] * width/1600);
  }
  drawBGBars(255);
  frameRate(24);
}

void draw(){
  //drawBGBars(1);
  noStroke();
  //for (int i=0; i<10000; i++) {
    //size
    w = random(20, 100);
    h = w;
  
    //location
    x = random(width-w);
    y = random(height-h);
    
    //color
    for(int z=0; z<widths.length; z++){
      if(x > xwidths[z]){
          fillcol = colors[z][round(random(5))];
      }
    }
    
    fill(fillcol, (50+random(100)));
    rect(x, y, w, h);

    //triangle?
  triDir = round(random(4)); //for triangle 0 = none  
  if (triDir > 0){
    noStroke();
    fill(0, (50+random(100)));
      switch(triDir) {
        case 0: 
          break;
        case 1:
          triangle(x,y, x,(y + h), (x + w),(y + h));
          break;
        case 2:
          triangle(x,y, (x + w),(y + h), (x + w), y);
          break;
        case 3:
          triangle((x + w),y, x,(y + h), (x + w),(y + h));
          break;
        case 4:
          triangle(x,(y + h), x,y, x,(y + h));
          break;
      }
    }
  //}
}




//draw bg bars
  void drawBGBars(int alph){
    prevX = 0;
    for(int w=0; w<colors.length ; w++){
      localColor = colors[w][5];
      noStroke();
      fill(localColor, alph);
      localWidth = (widths[w] * width)/1600;
      rect(prevX,0, localWidth,height);
      prevX +=localWidth;
    }
  }





