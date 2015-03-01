
int x = 1;
float alph = random(255);
void setup(){
size(500,500);
stroke(0);
strokeWeight(0.1);
background(255);
frameRate(30);

}
void draw(){
 for(int count = 0; count<5; count++){

    if(x <= 500){
    float randomy = random(200);
    x += 1;
    fill(64,156,245,alph);
    ellipse(x,randomy,20,20);
    if(x == 500){
     x = 1;
   }
    }
    }
    for(int count = 0; count<5; count++){

    if(x <= 500){
    float randomy = random(200,300);
    x += 1;
    fill(252,10,10,alph);
    ellipse(x,randomy,20,20);
    fill(255);
    text("mizutama3",250,250);
    textSize(40);
    if(x == 500){
     x = 1;
   }
    }
    }
     for(int count = 0; count<5; count++){

    if(x <= 500){
    float randomy = random(300,500);
    x += 1;
    fill(230,alph);
    ellipse(x,randomy,20,20);
    if(x == 500){
     x = 1;
   }
    }
    }
    
}


