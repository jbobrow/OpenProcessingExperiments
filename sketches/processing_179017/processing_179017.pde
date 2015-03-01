
import controlP5.*;


ControlP5 cp5;


String textValue = "";


Textarea myTextarea;

Button submit;



void setup() 
{
  
size(700,400);
  
  
PFont font = createFont("arial",20);
  
  
cp5 = new ControlP5(this);
  

  
myTextarea = cp5.addTextarea("txt")
                  
.setPosition(70,20)
                  
.setSize(500,50)
                  
.setFont(createFont("arial",20));
                  

//.setLineHeight(14)
                  
//.setColor(color(128))
                 
//.setColorBackground(color(255,100))
                  
//.setColorForeground(color(255,100));
                  
  

myTextarea.setText("PUNCHING MACHINE CONFIGURATION TOOL");                  
                  
  
cp5.addTextfield("Length of the substrate")
     
.setPosition(20,100)
     
.setSize(200,40)
     
.setFont(font)
     
.setFocus(true)
     
.setColor(color(255,0,0));
                 
  

cp5.addTextfield("Pitch Distance")
     
.setPosition(20,170)
     
.setSize(200,40)
     
.setFont(createFont("arial",20))
     
.setAutoClear(false);
     
  

cp5.addTextfield("Number of Dimples")
     
.setPosition(20,240)
     
.setSize(200,40)
     
.setFont(createFont("arial",20))
     
.setAutoClear(false);     
     
     
   

cp5.addTextfield("First Dimple Position")
     
.setPosition(300,100)
     .
.setSize(200,40)
     .
.setFont(createFont("arial",20))
     
.setAutoClear(false)
     ;
     
   

cp5.addTextfield("Grip Time")
     
.setPosition(300,170)
     
.setSize(200,40)
     
.setFont(createFont("arial",20))
     
.setAutoClear(false);
     
   

cp5.addTextfield("Punch Time")
     
.setPosition(300,240)
     
.setSize(200,40)
     
.setFont(createFont("arial",20))
     
.setAutoClear(false);     
     
     
   

// create a new button with name 'buttonA'
   
submit=cp5.addButton("Submit")
     
.setValue(0)
     
.setPosition(200,320)
     
.setSize(40,20);  

  

// and add another 2 buttons
  
cancel=cp5.addButton("Cancel")
     
.setValue(100)
     
.setPosition(300,320)
     
.setSize(40,20);  

}



void draw() {
  
background(0);
  
fill(255);
  

text(cp5.get(Textfield.class,"Length of the substrate").getText(), 360,130);
  
//text(cp5.get(Textfield.class,"Length of the substrate").getText(), 360,130);
  
text(textValue, 360,180);
}




void controlEvent(ControlEvent theEvent) 
{
  
if(theEvent.isAssignableFrom(Textfield.class)) 
{
println("controlEvent: accessing a string from controller '"
            +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  
}

}

void controlEvent(ControlEvent theEvent)

{
  
if(theEvent.isAssignableFrom(Button.class)) 
{

println("controlEvent: a button event from submit '"
        +theEvent.getName()+"': "
            +theEvent.getStringValue()
            );
  
}

}





public void input(String theText) 
{
  
// automatically receives results from controller input
  println("a textfield event for controller 'Length of the substrate' : "+theText);
}


// function submit will receive changes from 

// controller with name submit

//public void submit(int theValue)

//
{

//  println("a button event from submit: "+theValue);  

//
}

// function cancel will receive changes from 

// controller with name cancel



public void cancel(int theValue)

{
  
println("a button event from cancel: "+theValue);  

}

