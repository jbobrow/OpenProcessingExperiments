
float rect_x=30.5;
float rect_y=103.7;
float rect_w=100;
float rect_h=230.5;

void setup(){
  size(400,600);

};
void draw(){
  background(30,30,60);
  rect(rect_x, rect_y, rect_w, rect_h);
  
  if(mouseX>rect_x){ // if mouseX> left edge
    if(mouseX <rect_x + rect_w){// if mouseX> right edge
      if(mouseY> rect_y){// if mouseY> top
      if(mouseY<rect_y + rect_h){ //if mouse is above the bottom edge
    text("Right of rect", 10, 30);

      };
     };
    };
  };
};
