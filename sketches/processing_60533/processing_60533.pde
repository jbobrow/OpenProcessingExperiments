
// Have a counter value that just keeps counting (it will roll over once it
// hits the maximum value.
int counter;

// Create an empty list of all EllipseObj that are created.
// (The EllipseObj class is defined at the bottom)
ArrayList ellipseList = new ArrayList;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;      //start the counter at zero

}

// The main drawing loop
void draw()
{  

  counter++;                     // Each iteration increments the counter
  noStroke();                    //
  fill(random(255),100,255,50);  // Set the fill color to a random value (for the center color blob)
  
  
  
  //add some interaction
  if(mousePressed == true)
  { 
        // Create a new ellipse object and add it to the list of ellipses 
        // when the user preses in the window. (keeping width and height
        // the same to keep things simple)
        ellipseList.add(new EllipseObj(mouseX, mouseY, 20));
  }
  else
  {
    // Do swirly thing with the center color ball
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
      
    // Also check if any user-created ellipses are in the list.
    // If so, fade them until they become all white (at which point we'll delete them)
    for (int i = 0; i < ellipseList.size(); ++i)
    {
        // Iterate over the list.  i will go from 0 to the number of elements in the list
        // so if the ellipseList is empty (ie: size=0), it will just not go into this loop.
          
        // Get the i-th element of the list
        EllipseObj e = ellipseList.get(i);
        
        // Cause the chosen element to fade out.  Notice that the
        // function EllipseObj::fade() returns a boolean value that
        // says whether or not you have "faded" all the way from black to white.
        bool bDelete = e.fade();
        
        // If the ellipse has faded to white, we'll remove it from the list
        if (bDelete) { ellipseList.remove(i); }    
        
    } // End the user-ellipse fading loop
  } // End the case when the user hasn't pressed a button
 
// Display the number of objects in creation

// "blank out" the text with a white background
fill(255);
rect(0,0,200,20);

// Redraw the text in black
fill(0);
text("Number of EllipseObjects: " + EllipseObj.numObjects(),10,10); 


} // End the drawing loop

// Create a simple class to hold an elipse's state
class EllipseObj
{
    // A 'static' variable is one that has a shared value across *all* objects
    // of this class (EllipseObj).  Normally, each variable is local to an instance
    // of the object.
    static int m_NumberOfObjects = 0; // Start (initialize) with a count of zero
    
    float m_Greyscale;  // Each EllipseObj has its own greyscale value (0-255)
    float m_Xcoord;     // Each EllipseObj has its own x coordinate
    float m_Ycoord;     // Each EllipseObj has its own y coordinate
    float m_Size;       // Each EllipseObj has its own size

    // Construct a new elipse.  This function "instantiates a new EllipseObj"
    EllipseObj(float x, float y, float s)
    {
        m_Xcoord = x;      // Set the x coordinate to what was passed in.
        m_Ycoord = y;      // Set the y coordinate to what was passed in
        m_Size = s;        // Set the size to what was passed in
        m_Greyscale = 0;   // Set the greyscale value to zero (black)

        m_NumberOfObjects += 1;  // Increment the number of objects when constructing a new one.

        // I like to use the "m_" prefix to designate that the variable is a
        // member variable of this class.  A class lets you define any parameters
        // that you want to collect into an abstract description.

        // draw the initial circle
        fill(m_Greyscale);
        ellipse(m_Xcoord ,m_Ycoord, m_Size, m_Size);
    }
    // There is an implicit return value of a variable of type "EllipseObj"
    
    // Cause the ellipse to fade one level lighter.  The return value is 
    // a boolean parameter that tells you whether it has completely faded
    // to white or not.
    
    // Since this function is within the class definition of EllipseObj, it
    // is a member function of class EllipseObj.  Usually, this would be referred
    // to as EllipseObj::fade().  You'll see above, that if you have an EllipseObj "e"
    // you would call this function by saying: "e.fade();"
    bool fade()
    {
        // Under normal circumstances, the EllipseObj has not faded
        bool bHasFaded = false;
        
        // Move one step toward white
        m_Greyscale++;
        
        // Redraw the ellipse.  The "m_" variables belong to this particular instance
        // of your EllipseObj. This is how you can keep information compartmentalized
        // and saved in between calls of the EllipseObj::fade() function.
        fill(m_Greyscale);
        ellipse(m_Xcoord ,m_Ycoord, m_Size, m_Size);
        
        // If we've gone all the way to white, we'll set the return value appropriately.
        // This way the calling function knows to do something with this object.
        if (m_Greyscale>= 255)
        {
            bHasFaded = true;
            
            // When it's faded away, decrement the count, since it's considered "gone"
            m_NumberOfObjects -= 1;
        }
        return bHasFaded;
    }
    // A trivial function that returns the number of EllipseObj objects that have
    // been created.  Since this function is declared as "static", you don't call
    // it with an instance of the EllipseObj, but rather with the class name itself.
    // IE: Instead of doing:
    //
    // EllipseObj e = new EllipseObj();
    // e.numObjects();
    //
    // You can call it like this:
    // 
    // EllipseObj.numObjects();
    //
    // This reinforces the concept that the static function is applicable to *all*
    // instances of the class, not just a single, specific instance.
    static int numObjects()
    {
        return m_NumberOfObjects;
    }
}  //End of the class definition of EllipseObj
