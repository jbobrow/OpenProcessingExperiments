
void setup() {
        size(1000,1000);
        fillArraysWithInitialPositions(50);  // do just for the first 50 Frame. initial positions.
    } // end of setup() method.
    
float[] lastPointerLocations_X;
float[] lastPointerLocations_Y;       

    
void draw() {

            background(0);
            popInNewPositions();             // Pop-in to the Stack last Pointer Positions.
            drawTailToMouse() ;              // Draw Ellipses to mouseLocations as mouse tail.     

    } // end of draw() method.
            
void fillArraysWithInitialPositions(int numOfPosToBeSaved) {
     
        lastPointerLocations_X = new float[numOfPosToBeSaved];
        lastPointerLocations_Y = new float[numOfPosToBeSaved];
               
        // Fills the first elements of Array with initial Mouse Positions.
        for (int index = 0; index < numOfPosToBeSaved; index++) {
            lastPointerLocations_X[index] = mouseX;
            lastPointerLocations_Y[index] = mouseY;
        }
    } // end of fillArraysWithInitialPositions() method.
 
    
void popInNewPositions() {
     /* METHOD DEFINITION: POPS IN VALUES TO THE ELEMENTS IN ARRAYS FROM LAST
     * POINT OF THE ARRAYS THAT MAIN CLASS HAS.
     * PRE.CONDITION: THE ARRAYS SHOULD BE DEFINED CORRECTLY BEFORE THIS METHOD
     * OPERATES ON THEM.
     * POST.CONDITION: METHOD POPS IN  THE VALUES OF MOUSE POSITIONS TO ARRAYS.
     */       
        
        float newPosX = mouseX;
        float newPosY = mouseY;
        
        // Shift the elements of Array before pop in the values.
        shiftElementsInArraysToLeftOnce();
    
        // pops In the values to the Given Arrays.
        popInValuesToArrays(newPosX, newPosY);    
    
    } // end of popInNewPosition() method.
    
   
void shiftElementsInArraysToLeftOnce() {
    /* METHOD DEFINITION: SHIFS ELEMENTS IN ARRAYS FROM RIGHT TO LEFT.
     * ASSIGNS EVERY ELEMENT OF ARRAY TO THE VALUE THAT RIGHT NEXT TO IT HAS.
     * PRE.CONDITION: THE ARRAYS SHOULD BE DEFINED CORRECTLY BEFORE THIS METHOD
     * OPERATES ON THEM.
     * POST.CONDITION: METHOD SHIFTS THE VALUES TO LEFT.ONLY THE LAST ELEMENT'S 
     * VALUE REMAINS NOT BEEN SHIFTED.
     */
        // Length of Both Arrays.
        int lengthOfArrays = lastPointerLocations_X.length;
        
        // Go through all the indexes and assign each one to next left one.
        for(int index = 1; index < lengthOfArrays; index++) {
            lastPointerLocations_X[index-1] = lastPointerLocations_X[index];
            lastPointerLocations_Y[index-1] = lastPointerLocations_Y[index];
        }
    } // end of shiftElementsInArraysToLeftOnce() method.  
    
    
void popInValuesToArrays(float tempX, float tempY) {
    /* METHOD DEFINITION: POPS IN GIVEN VALUES TO LAST ELEMENTS OF BOTH ARRAYS
     * PRE.CONDITION: THE ARRAYS SHOULD BE SHIFTED BEFORE USAGE OF THIS METHOD.
     * POST.CONDITION: METHOD INSERTS THE VALUES TO LAST ELEMENTS OF ARRAYS.
     */
       int lastIndexNum = lastPointerLocations_X.length - 1;
       
       lastPointerLocations_X[lastIndexNum] = tempX;
       lastPointerLocations_Y[lastIndexNum] = tempY;   
    } // end of popInValuesToArrays() method.

    
void drawTailToMouse() {
    /* METHOD DEFINITION: DRAW ELLIPSES TO THE RECORDED POSITIONS.
     * PRE.CONDITION: THE ARRAYS RECORDINGS OF POSITIONS ARE TAKEN FROM OTHER 
     * METHODS.
     * POST.CONDITION: METHOD DRAWS ELLIPSES WITH DIFFERENT FILL COLOR AND DIAMETERS
     * ON SCREEN WITH USING THE RECORDING POSITIONS.
     */
       int diameterSize = 10;   // Initial Size of Furthest Ellipse.
       int fillColor = 250;             // Initial fillColor for Furthest Ellipse.

        // Length of Both Arrays.
        int lengthOfArrays = lastPointerLocations_X.length;
        
        for(int index = 0; index < lengthOfArrays; index++) {
            fill(fillColor);
            ellipse(lastPointerLocations_X[index], lastPointerLocations_Y[index], diameterSize, diameterSize);
            
            diameterSize += 3;
            fillColor -= 20;
        }
 
    } // end of drawTailToMouse() method.
   





