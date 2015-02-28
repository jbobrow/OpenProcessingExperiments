
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

int maxLines = 8;
int maxFrameR = 15;
int minFrameR = 5;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  stroke(0, 0, 0, 90);
  fill(255);
 
}

void draw() {  
//give it some randomness 
frameRate(random(minFrameR,maxFrameR));
lines = random(maxLines);

//draw the lines
for(int i = 0; i<lines; i++){
        curve(random(width), random(height), random(width), random(height), random(width), random(height), random(width), random(height));
    }
}
