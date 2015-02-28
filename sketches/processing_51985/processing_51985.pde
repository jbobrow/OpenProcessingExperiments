
//Vanessa Faienza
//Wed. Class
//PS1 Question 4 - 8x8 Grid 

int NumberBars = 35;
int columns, rows;

void setup() {
size(280,280); 
columns = width/NumberBars; 
rows = height/NumberBars; 
}

void draw() {


for (int a = 0; a < columns; a++) { 

for (int b = 0; b < rows; b++) { 


int x = a*NumberBars;
int y = b*NumberBars; 

stroke(0);

rect(x,y,NumberBars,NumberBars); 



}
}
}    
                
