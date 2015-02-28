
//Algae L-System, v.0.000000000000001
//A simple sketch that grows binary results based on two simple rules A->AB, B->A.
//See http://en.wikipedia.org/wiki/L-system#Example_1:_Algae for more.
//
// By Digital_Babu 2009

PFont f;
ArrayList startset = new ArrayList(); //create the initial arraylist startset
int iterations = 9;  //number of times we would like to run the function 'checkset'


void setup(){
  f= loadFont("Courier.vlw");
  textFont(f,12);
  background(0);
  fill(255);
  smooth();
  size(800,150);
  startset.add(new AB(true)); //create the initial startset situation: {true}.
}

void draw(){
  int startheight = 12;
  text("n=0 A",1,startheight);
  
  ArrayList newset = checkset(startset); //checks the startset we go from n=0 to n=1
  
  
  for (int n = 0; n < iterations; n++){ //loop for how many times we want to call the function checkset, this is n
    
    String nresult = ""; //create an empty string to fill with the results
    
    for (int i = 0; i < newset.size(); i++){ //loop through the set
      AB result = (AB) newset.get(i);        //element to var
      
      if(result.stat == true){
      //true
      String t = "A";
      nresult = nresult + t; //add result to the final string
      }else 
      if(result.stat == false){
      //false
      String f = "B";
      nresult = nresult + f; //add result to the final string
      }   
      
    }//end iterating through the set
    text ("n="+(n+1)+" "+nresult, 1, startheight+15);
    startheight += 15;
    //println ("n="+(n+1)+" "+nresult); //print the n followed by the current situation
    newset = checkset(newset);          //n + 1 on the situation
    
  }//end iterations
  noLoop();
} //end draw()


// *** Function 'checkset' ****
//
// Description:
// Checks the given objset with the following (Lindenmayer Algae) rules.
// 
// rule 1: true -> add {true, false}
// rule 2: false -> add {true}
//

ArrayList  checkset(ArrayList objset){

  //create the buffer, and make sure it starts empty
  ArrayList buffer = new ArrayList();
  buffer.clear(); // clear the buffer


  for (int i = 0; i < objset.size(); i++){                                     //start set elements loop

    //put element i in var t for testing
    AB t = (AB) objset.get(i);

    //check rule 1, add result to buffer
    if (t.stat == true){
      buffer.add(new AB(true));
      buffer.add(new AB(false));
      //check rule 2, add result to buffer  
    }
    else if(t.stat == false){
      buffer.add(new AB(true));
    }

  }                                                                             //end set elements loop  
  objset.clear(); //clear the set
  objset.addAll(buffer); //add results (buffer) to the set
  return objset;
}


//Simple class that can create objects that are either true or false.
class AB{
  boolean stat;

  AB(boolean stat_){
    stat = stat_;
  }
}


