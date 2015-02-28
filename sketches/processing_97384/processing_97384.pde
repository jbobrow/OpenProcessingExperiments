
String[] list = {
"It's going to be okay probably",

"At least you aren't illiterate",

"You are stronger than most birds",

"Everything will be okay because we die",

"The Sun loves you so much he can't contain himself",

"'Treat everyone like they are a newborn baby'",

"When the going gets tough, fix the problem",

"This is not the worst problem",

"15% of problems can be solved by eating a piece of fruit",

"Failure is a bullet, but you are holding the gun",

"Nobody can peel a banana correctly",

"The carpet's always beiger on the other side",

"You don't need an HDMI cable to see clearly",

"You don't have to be brave to read a book",

"Love is the not the same as kindness",

"Don't say things like you are ugly",

"Stop acting lost or no one is going to find you",

"Be a person, lose the compass",

"Hapless muscle gains",

"You move forward when the treadmill is going to slow",

"Don't be afraid of the stuff you are afraid of",

"Be the Polar Bear",

"Sunlight cleanses the soul and dries laundry",

"If lightning, hit the switch",

"Build your own shit",

"This is all quite simple",

"History happened",

"Buy a new pen",

"If you fail, stop",

"Slit the throat of failure",

"Everyone is a “civil engineer”",

"Drive fast (but not too fast)",

"Be a human stapler",

"Refrigerate your hate",

"Never hold fireworks or grudges",

"Don't talk about the weather. Be the weather.",

"Pet every dog you see",

"Sing in the shower, also outside the shower",

"Don't let cats take advantage of you",

"That shirt looks good on you",

"It's not a flashlight until you add batteries",

"Recycle everything except sadness",

"If you can't stand the heat, take off your sweater",

"Take a confidence pill",

"Compliment egregiously",
};


int listsize, index = 0;
PVector location, gravity, speed;
boolean bounce = false;


void setup() {
	size(400,400);

        if (frame != null) {
        frame.setResizable(true);
        }
	background(255,255,255);
	listsize = list.length;
        fill(0,0,0);
        textSize(30);
        
        Collections.shuffle(Arrays.asList(list));

	location = new PVector(mouseX, mouseY);
        speed = new PVector(0,0);
        gravity = new PVector(0,1);
        
}

void draw() {
  background(255,255,255);
  speed.add(gravity);
  location.add(speed);
  
  if(location.y > height) {
    location.y = height;
    speed.y *= -1; 
    bounce = true;
  }
  
  if(speed.y > 0 && bounce) {
    speed.limit(0);
    gravity.limit(0);
  }
  
  text(list[index],location.x,location.y);
        
}

void mouseClicked() {
  background(255,255,255);
  index++;
  if(index == listsize) {
    index = 0;
    Collections.shuffle(Arrays.asList(list));
  }
  location.set((float)mouseX,(float)mouseY,0);
  speed.limit(0);
  gravity.set(0,1,0);
  bounce = false;
}


