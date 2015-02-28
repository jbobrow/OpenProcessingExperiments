


boolean mode = true;  

String answers [] = {  

  "probably not", "don't count on it", "nope", "without a doubt", "not sure", "certainly", "no", "yes", "most likely", "rely on it", "idk", "very doubtful", "outlook good", "yes definitely"
};  

void setup()  

{  

  size(500, 540);  

  background(123, 145, 178);  

  textAlign(CENTER);  

  textSize(23);  

  smooth();  

  noLoop();
}  

void draw()  

{  



  int i = int(random(17));  

  fill(0);  

  ellipse(250, 250, 400, 400);  

  if (mode == true)  

  {    

    fill(255);  

    ellipse(250, 250, 300, 300);  

    text("Ask a Yes or No question", 250, 475);  

    noFill();  

    strokeWeight(6);  

    ellipse(250, 205, 60, 50);  

    ellipse(250, 270, 90, 75);  

    strokeWeight(1);
  }  

  else if (mode == false)  

  {  

    fill(123, 145, 178);

    ellipse(250,250,300,300);

    fill(0, 255, 20);  

    triangle(125, 210, 375, 210, 250, 320);  

    fill(255);  

    text(answers[i], 250, 300);
  }
}  

void mousePressed()  

{  

  if (mouseX > 100 && mouseX < 400 && mouseY > 100 && mouseY < 400)  

  {  

    mode = !mode;  

    redraw();
  }
} 


