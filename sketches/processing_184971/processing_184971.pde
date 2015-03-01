
var BounceRectNum = 50;
var bounceRectSize = 7;
var margin = 10;
var speed = 2 ;

function BounceRectDisplay(){
  //fill(this.col, 50, 255);
  rect(this.x,this.y, this.h, this.w);
}
function BounceRectMove(){
  //上右下左
  switch(this.dire){
    case 0:
      this.y -= speed;
      if(this.y < -margin) this.dire = turn(this.dire);
      break;
    case 1:
      this.x += speed;
      if(this.x > width + margin) this.dire = turn(this.dire);
      break;
    case 2:
      this.y += speed;
      if(this.y > height + margin) this.dire = turn(this.dire);
      break;
    case 3:
      this.x -= speed;
      if(this.x < -margin) this.dire = turn(this.dire);
      break;
  }
}
function turn(var _num){
  var num = _num;
  num += 2;
  if(num>3)num -= 4;
  return num;
}
function BounceRectCollision(){
  for(var i= this.num+1 ; i<bounceRectList.length; i++){
    var xdist = abs(this.x - bounceRectList[i].x);
    if(xdist < bounceRectSize){
      var ydist = abs(this.y - bounceRectList[i].y);
      if(ydist < bounceRectSize){
        this.dire = turn(this.dire);
        bounceRectList[i].dire = turn(bounceRectList[i].dire);
        switch(this.dire){
          case 0:this.y -= (bounceRectSize-ydist);break;
          case 1: this.x += (bounceRectSize-xdist);break;
          case 2: this.y += (bounceRectSize-ydist);break;
          case 3: this.x -= (bounceRectSize-xdist);break;
        }
        this.turned = true;
      }
    }
  }
}

function BounceRect(var _num){
  this.num = _num;
  this.col = random(255);
  this.h = bounceRectSize;
  this.w = bounceRectSize;
  this.turned = false;
  this.x = floor(random(width)/bounceRectSize)*bounceRectSize;
  this.y = floor(random(height)/bounceRectSize)*bounceRectSize;
  this.px = 0;
  this.py = 0;
  this.ppx = 0;
  this.ppy = 0;
  this.dire = floor(random(4));
  this.display = BounceRectDisplay;
  this.move = BounceRectMove;
  this.collision = BounceRectCollision;
}

var bounceRectList = new Array();

void setup(){
  rectMode(CENTER);
  colorMode(HSB);
  frameRate(30);
  size(300,180);
  background(255);
  for(var i = 0; i< BounceRectNum; i++){
    bounceRectList.push(new BounceRect( i ) );
  } 
}

void draw(){
  background(255);
  
  for(var i = 0; i< bounceRectList.length; i++){
    bounceRectList[i].move();
    bounceRectList[i].collision();
    bounceRectList[i].display();
  } 
}

var bMoving = true;
void mousePressed(){
  bMoving = !bMoving;
  if(bMoving) loop();
  else  noLoop();
}

