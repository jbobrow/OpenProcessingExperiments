
PShape person;
PShape person2;
PFont g;
PFont f;

void setup(){
  size(500,500);
  person2 = loadShape("Person2.svg");
  person = loadShape("Person.svg");
 g = createFont( "Garamond",72);
f= createFont( "Garamond",14);
  smooth();
  noStroke();
  textAlign(CENTER,CENTER);
  
}

void draw(){
   background(255);
   fill(0);
  shape(person,0,0,500,500);
  if(key== 'o'){
      fill(0);
    textFont(g,72);
   text("O",250,40);
  ellipse(250,250,30,30);
    fill(255);
   textFont(f,14);
   text("1 in 3 children are overweight",250,190);
    text("or obese.",250,205);
     
    
  }if(key== 'b'){
      fill(0);
       textFont(g,72);
   text("Ob",250,40);
  ellipse(250,250,60,60);
    fill(255);
   textFont(f,14);
   text("2 in 3 adults are overweight",250,190);
    text("or obese.",250,205);
     
  }if(key== 'e'){
      fill(0);
       textFont(g,72);
   text("Obe",250,40);
  ellipse(250,250,90,90);
     fill(255);
   textFont(f,14);
   text("Only 19% of Americans get the",250,190);
    text("recommended",250,235);
     text("amount of",250,250);
    text("exercise.",250,265);
  
}if(key== 's'){
  fill(0);
   textFont(g,72);
   text("Obes",250,40);
  ellipse(250,250,120,120);
      fill(255);
   textFont(f,14);
   text("In the past",250,215);
    text("twenty years",250,230);
     text("obesity has risen",250,245);
     text("by more 5%",250,260);
  
}if(key== 'i'){ 
  fill(0);
   textFont(g,72);
   text("Obesi",250,40);
  ellipse(250,250,150,150);
     fill(255);
   textFont(f,14);
   text("Having a friend",250,215);
    text("who is obese increases",250,230);
     text("your chance of being",250,245);
     text("obese by 57%",250,260);
  
}if(key== 't'){
    fill(0);
     textFont(g,72);
   text("Obesit",250,40);
  ellipse(250,250,180,180);
  fill(255);
   textFont(f,14);
   text("'Child obesity has become",250,215);
   text("so serious that miliatry leaders",250,230);
   text("are viewing this epidemic",250,245);
   text("as a potential threat to our",250,260);
   text("national security.'- U.S. Army",250,275);
   text("General Johnnie Wilson",250,290);
}if(key== 'y'){
  shape(person2,0,0,500,500);
  fill(0);
   textFont(g,72);
   text("Obesity",250,40);
  ellipse(250,250,210,210);
   fill(255);
   textFont(f,14);
   text("1 in 5 deaths in the",250,215);
    text("U.S. is associated",250,230);
     text("with obesity.",250,245);
}else{
}
}


