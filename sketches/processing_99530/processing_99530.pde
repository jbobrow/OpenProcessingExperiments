
import gifAnimation.*;
Gif myGif;
Gif myWater;
Fish[] myFish;
Food[] myFood;
int counter;
//location of fish, position of food, turn into vector
PVector location;
PVector position;

void setup() {
    size(1000,600);
    background(255);
    smooth();
    PVector location = new PVector(random(width-20), random(height-20));
    PVector position = new PVector(mouseX, mouseY);
    
    //import gifs of fish and pond
    myGif=new Gif(this, "Fish.gif");
    myWater= new Gif(this,"Pond.gif");
    myWater.play();
    myGif.play();

    //build an array of six fishes
    myFish=new Fish[6];
    for (int n=0; n<myFish.length; n++) {
        myFish[n]=new Fish();
    }
    
    //set food pieces to 100 to keep the game running
    myFood=new Food[100];
    for (int i=0; i<myFood.length; i++) {
        myFood[i]=new Food();
    }
}

void draw() {
    background(255);
    image(myWater,0,0);
    fill(random(255));
    textSize(36);
    text("Feed Fish", 80,80);
    fill(255);
    textSize(12);
    text("Tips: Don't distract the fish by moving your mouse frequently!", 80,120);
    text("Don't feed too many for each single time!", 122, 150);
    text("Don't blame the fish if they didn't want to eat!",122,180);
    
    //let the food appear
    for (int i=0; i<myFood.length; i++) {
        myFood[i].Foodshow();
    }
    //let the fish swim
    for (int n=0; n<myFish.length; n++) {
        myFish[n].Fishshow();
        myFish[n].Fishswim();
        myFish[n].checkEdges();
    }
    //let the fish eat food
    Foodeaten();
}

//drop food, let the food appear piece by piece
void mouseClicked() {
    println(counter);
    myMouse();
}

void myMouse() {
if (counter<100) {
counter ++;
if (myFood[counter].FoodIsVisible==false) {
myFood[counter].foodPlace(mouseX,mouseY);
myFood[counter].FoodIsVisible = true;
         }
     }
else{
    // 
    for (int i=0 ; i<myFood.length; ++i) {
        if (!myFood[i].FoodIsVisible)
        {
            myFood[i].foodPlace(mouseX, mouseY);
            myFood[i].FoodIsVisible = true;
        }
    }
} 
}

//build the function: when fish swim close enough to the food 
//fish eat food, food disappear
void Foodeaten() {
    for (int i=0 ; i<myFood.length; ++i) {
        PVector tmp_position = myFood[i].position;
        for (int n=0 ; n<myFish.length; n++) {
            PVector tmp_location = myFish[n].location;
            if (tmp_location.x+10<tmp_position.x+10 && 
                tmp_location.x+10>tmp_position.x-10 && 
                tmp_location.y+10<tmp_position.y+10 &&
                tmp_location.y+10>tmp_position.y-10) {
                myFood[counter].FoodIsVisible = false;
                break;
            }
        }
    }
}









//build a class of fish
//turn the class into vector so that they swim paths are easier to trace
class Fish {
    PVector location;
    PVector velocity;
    PVector acceleration;
    float topspeed;

    //contructor: fish location, velocity of fish swimming
    Fish() {
        location = new PVector(random(width), random(height));
        velocity = new PVector(0,0);
        topspeed = 30;
    }

    //let the fish appear in the screen first
    void Fishshow() {
        pushMatrix();
        translate(location.x-10,location.y-10);
        frameRate(3);
        scale(0.3);
        image(myGif,0,0);
        popMatrix();
    }

    //make the fish swim towards the food position
    void Fishswim() {
        PVector position = new PVector(mouseX, mouseY);
        //find the path
        PVector dir = PVector.sub(position,location);
        dir.normalize();
        dir.mult (0.8);
        acceleration = dir;
        velocity.add(acceleration);
        velocity.limit(topspeed);
        location.add(velocity);
    }

    //keep fish swimming within the edges
    void checkEdges() {
        if (location.x>width-10) {
            location.x = 10;
        } else if (location.x<10) {
            location.x = width-10;
        }

        if (location.y>height-10) {
            location.y = 10;
        } else if (location.y<10) {
            location.y = height-10;
        }
    }

}
//build a class of food
//turn food location into vector for fish's swimming path

class Food {
    PVector position;
    boolean FoodIsVisible;

    //constructor: food position equals mouse position, boolean of foodshow
    Food () {
        position = new PVector(mouseX, mouseY);
        FoodIsVisible=false;
    }

    //make the food appear 
    void Foodshow() {
        if (FoodIsVisible==true) {
            noStroke();
            fill(#9DFF0D);
            ellipse(position.x, position.y, 8, 8);
        }
        else
        {
            noFill();
        }
    }
  
    //assign position to food
    void foodPlace(int myX, int myY) {
        position.x=myX;
        position.y=myY;
    }

}



