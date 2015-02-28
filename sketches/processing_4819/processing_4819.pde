
//hoofdinformatie

void setup() { 
   
  size (400,420); 
} 
 
void draw()  
{ 
   background(0); 
  
  if (mouseX < 200 && mouseY <200) { 
  fill (234,0,17); 
  rect (0,0,200,200); 
} 
else if(mouseX > 200 && mouseY < 200) { 
  fill (85,228,21); 
  rect (200,0,200,200); 
}  
else if(mouseX < 200 && mouseY > 200) { 
  fill (0,0,255); 
  rect (0,200,200,200); 
}  
else if(mouseX > 200 && mouseY > 200) { 
  fill (255,246,0); 
  rect (200,200,200,200); 
} 
} 

//blokjes onderaan

for(int i=0; i<20; i++)
{int kleur = 255-(i*(255/20));

fill(255,kleur,kleur);

rect(i*20,400,20,20);
}
for(int i=0; i<20; i++) 
{ int kleur = 255-(i*(255/20)); 
  fill(255,kleur,kleur); 
   
  rect(i*20,400,20,20); 
} 
 
} 
 
 
for(int i=0; i<20; i++) 
{ int kleur = 255-(i*(255/20)); 
  fill(255,kleur,kleur); 
   
  rect(i*20,400,20,20); 
} 
 
} 
 
 
for(int i=0; i<20; i++) 
{ int kleur = 255-(i*(255/20)); 
  fill(255,kleur,kleur); 
   
  rect(i*20,400,20,20); 
} 
 
} 
 
 
for(int i=0; i<20; i++) 
{ int kleur = 255-(i*(255/20)); 
  fill(255,kleur,kleur); 
   
  rect(i*20,400,20,20); 
} 
 
} 
 
 
for(int i=0; i<20; i++) 
{ int kleur = 255-(i*(255/20)); 
  fill(255,kleur,kleur); 
   
  rect(i*20,400,20,20); 
} 
 
} 
 
 



