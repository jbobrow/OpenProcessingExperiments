
Num[] nums;
int[] list;

void setup(){
 size(screen.width,screen.height);
 //size(500,500);
  background(0);
 noStroke();
fill(255); 

nums = new Num[2];

list = new int[nums.length];

for(int i = 0; i < nums.length; i++) {
  nums[i] = new Num( floor(random(20,100)),
                     floor(random(width/4, 3*width/4)),
                     floor(random(height/4, 3*height/4))
                    );
}

}

void draw(){
 
  background(0);
 
 for(int i = 0; i < nums.length; i++) {
  nums[i].draw();
  list[i] = nums[i].num;
 }
 
 //println(max(list));
 
  
}

void mousePressed(){
    
    for(int i = 0; i < nums.length; i++) {
      
      if( mouseX >=  nums[i].xPos - 50 && mouseX <=  nums[i].xPos + 50  ){
        if( mouseY >=  nums[i].yPos - 50 && mouseY <=  nums[i].yPos + 50  ){
          if( nums[i].num == max(list) ) {
      nums[i].draw();
      nums[i].update();
          }
        }
     }
     
    }
   
}

class Num {
  int num,txtSiz, xPos, yPos;
  
  Num(int _txtSiz, int _xpos, int _ypos){
    
    //init number
    num = floor(random(0,10));    
    txtSiz = _txtSiz;
    xPos = _xpos;
    yPos = _ypos;
    
  }
  
  void draw(){    
    textSize(txtSiz);
    text(num, xPos, yPos );    
  }
  
  void update() {
    
    for(int i = 0; i < nums.length; i++) {
  nums[i] = new Num( floor(random(20,100)),
                     floor(random(width/4, 3*width/4)),
                     floor(random(height/4, 3*height/4))
                    );
}
  }
  
}
