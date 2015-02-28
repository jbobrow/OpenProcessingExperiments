
/*
    Tiffany Vedua - 25 Forms
*/


float form1Size[] = {80,95};
float form2Size[] = {65,80};
float form3Size[] = {45,65};
float form4Size[] = {30,45};
float form5Size[] = {10,30};

float form1ColorR[] = {0,255};
float form1ColorG[] = {0,255};
float form1ColorB[] = {0,255};

float form2ColorR[] = {0,255};
float form2ColorG[] = {0,255};
float form2ColorB[] = {0,255};

float form3ColorR[] = {0,255};
float form3ColorG[] = {0,255};
float form3ColorB[] = {0,255};

float form4ColorR[] = {0,255};
float form4ColorG[] = {0,255};
float form4ColorB[] = {0,255};

float form5ColorR[] = {0,255};
float form5ColorG[] = {0,255};
float form5ColorB[] = {0,255};

int formX = 50;
int formY = 50;
int rowNum = 0;
int counter = 0;
 
form[] myForm = new form[25];                       
 
void setup(){
  background(0);
  size(500,500);
  for (int i=0;i<myForm.length;i++) {
    myForm[i] = new form(
      random(form1Size[0],form1Size[1]),
      random(form2Size[0],form2Size[1]),
      random(form3Size[0],form3Size[1]),
      random(form4Size[0],form4Size[1]),
      random(form5Size[0],form5Size[1]),
      
      random(form1ColorR[0],form1ColorR[1]),
      random(form1ColorG[0],form1ColorG[1]),
      random(form1ColorB[0],form1ColorB[1]),
      
      random(form2ColorR[0],form2ColorR[1]),
      random(form2ColorG[0],form2ColorG[1]),
      random(form2ColorB[0],form2ColorB[1]),
      
      random(form3ColorR[0],form3ColorR[1]),
      random(form3ColorG[0],form3ColorG[1]),
      random(form3ColorB[0],form3ColorB[1]),
      
      random(form4ColorR[0],form4ColorR[1]),
      random(form4ColorG[0],form4ColorG[1]),
      random(form4ColorB[0],form4ColorB[1]),
      
      random(form5ColorR[0],form5ColorR[1]),
      random(form5ColorG[0],form5ColorG[1]),
      random(form5ColorB[0],form5ColorB[1])

    );
  }
 
  background(0);
  for (int i=0;i<myForm.length;i++){
    pushMatrix();
    translate(50,0);
    formX = 100 * counter;
    counter++;
    myForm[i].run();
    popMatrix();
    if (counter == 5){
      formY = formY + 100;
      counter = 0; 
    }
  }
}
 
 
class form{
  float form1Size;
  float form2Size;
  float form3Size;
  float form4Size;
  float form5Size; 
  
  float form1ColorR; 
  float form1ColorG; 
  float form1ColorB;
  
  float form2ColorR; 
  float form2ColorG; 
  float form2ColorB; 
    
  float form3ColorR; 
  float form3ColorG; 
  float form3ColorB; 
    
  float form4ColorR; 
  float form4ColorG; 
  float form4ColorB; 
  
  float form5ColorR; 
  float form5ColorG; 
  float form5ColorB; 
 
  form(float _form1Size, float _form2Size, float _form3Size, float _form4Size, float _form5Size, 
          float _form1ColorR, float _form1ColorG, float _form1ColorB,
          float _form2ColorR, float _form2ColorG, float _form2ColorB,
          float _form3ColorR, float _form3ColorG, float _form3ColorB,
          float _form4ColorR, float _form4ColorG, float _form4ColorB,
          float _form5ColorR, float _form5ColorG, float _form5ColorB){
  form1Size = _form1Size;
  form2Size = _form2Size;
  form3Size = _form3Size;
  form4Size = _form4Size;
  form5Size = _form5Size;
  
  form1ColorR = _form1ColorR;
  form1ColorG = _form1ColorG;
  form1ColorB = _form1ColorB;
  
  form2ColorR = _form2ColorR;
  form2ColorG = _form2ColorG;
  form2ColorB = _form2ColorB;
  
  form3ColorR = _form3ColorR;
  form3ColorG = _form3ColorG;
  form3ColorB = _form3ColorB;
  
  form4ColorR = _form4ColorR;
  form4ColorG = _form4ColorG;
  form4ColorB = _form4ColorB;
  
  form5ColorR = _form5ColorR;
  form5ColorG = _form5ColorG;
  form5ColorB = _form5ColorB;
}
   
  void run(){
    display();
  }
 
void display(){
    noStroke();
    fill(255);
     
    //form1
    fill(form1ColorR, form1ColorG, form1ColorB);
    ellipse(formX, formY, form1Size, form1Size);
     
    //form2
    fill(form2ColorR, form2ColorG, form2ColorB); 
    rect(formX, formY, form2Size, form2Size);   
     
    //form3
    fill(form3ColorR, form3ColorG, form3ColorB);
    ellipse(formX, formY, form3Size, form3Size);   
    
    //form4
    fill(form4ColorR, form4ColorG, form4ColorB);
    rect(formX, formY, form4Size, form4Size);
    
    //form5
    fill(form5ColorR, form5ColorG, form5ColorB);
    ellipse(formX, formY, form5Size, form5Size);
  }
}



