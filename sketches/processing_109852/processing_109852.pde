

size(300, 300);
background(0, 0, 255);

float x = 150;
float y = 150;
float diamiter = 100;

ellipse(x, y, diamiter, diamiter);

x = x + 100;
y = y + 100;
diamiter = diamiter + 100;

ellipse(x, y, diamiter, diamiter);

x = x / 2;
y = y / 2;
diamiter = diamiter / 2;

ellipse(x, y, diamiter, diamiter);

  fill(255, 0, 0, 75);
  ellipse(width / 2, height / 2, width, height);
  
  fill(0, 255, 0, 75);
  rect(width /3, height /3, width / 3, height / 3);
  
  fill(255, 255, 0, 75);
  triangle(0, height / 4, width / 2, 0, width, height / 4);

    float xl = 55;
    stroke(0);
    
    line(xl, 10, xl, 100);
    
    line(xl * 1.3, 10, xl * 1.3, 100);
    
    line(xl * 2, 10, xl * 2, 100);
    
    line(xl * 2.6, 10, xl * 2.6, 100);
    
    line(xl * 4, 10, xl * 4, 100);
   


