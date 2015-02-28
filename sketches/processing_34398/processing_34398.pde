

color blk;
color wht;
int counter;
int wid;
int hei;

void setup() {  //setup function called initially, only once
  wid = 250;
  hei = 250;
  blk = color(0);
  wht = color(255);
  
  size(wid,hei);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  
  if(mousePressed == true) { //add some interaction
     set(mouseX, mouseY, blk);
  }
  else {
    //scan all pixels
    for (int y = 0; y <= hei; y++){
        for (int x = 0; x <= wid; x++){
            //if black set self white and infect neighbors
            color c = get(x,y);
            if(c==blk){
                if ((x>0&&x<wid)&&(y>0&&y<hei)){
                    set(x,y,wht);
                    set(x-1,y,blk);
                    set(x+1,y,wht);
                    set(x,y-1,blk);
                    set(x-1,y-1,wht);
                    set(x+1,y-1,blk);
                    set(x,y+1,wht);
                    set(x-1,y+1,blk);
                    set(x+1,y+1,wht);
                } 
            }

        }
    }
  }
}
/*
void performSwap() {
    //scan all pixels
    
    for (int y = 0; y<=hei;y++){
        for (int x = 0; x<=wid, x++){
            //if black set self white and infect neighbors
            //color c = get(x,y);
             
        }
    }

} */               
