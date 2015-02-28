
//HW # 3
//Better late than never...

int var1, var2;

void setup(){
  size(400,300);
  var1 = 0;
  var2 = 1;
  colorMode(HSB, 100, 100, 100);
}

void draw(){
  noStroke();
  fill(var2+=.5, 100,100);
  rect(var1++, 150, 40,40);
  if(var1 >= width){
    var1=0;
  }

  fill(40);
  stroke(var2/2);
  rect(0, var2++, 400, var2++);
if(var2 >= height){
  var2 = 0;
 }
}

