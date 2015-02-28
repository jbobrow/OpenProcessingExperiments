
import processing.serial.*;

/* Global variables */
PFont font;                              // The font used to write to the screen
Serial myPort;                           // The Serial port connected to Arduino
float [] sensorReadings = new float[9];  // Used to store the 9 sensor readings
float [] expectedResult = new float[4];  // Used to store the expected result 
float [] networkResult = new float[4];   // Used to store the output of the neural network
int sensorReadCounter=0;                 // used to count sensor readings
String outputFile1="";                   // Variable to hold the location of the output file.
String outputFile2="";                   // Variable to hold the location of the output file.
Boolean detecting=false;                 // used to switch between detecting and calibrating
int intensity = 255;                     // The intensity that we want the RGB to glow on the Arduino
ArrayList sensorData;                    // The arraylist to hold the imported sensor data from a file
ArrayList expectedData;                  // The arraylist to hold the imported expected results from a file
String inputFile="";                     // The string to hold the file name of the sensor data to import.
NeuralNetwork network;                   // The neural network
float networkTrainingLimit = 0.1;        // The acceptable error of the network
int networkCycleLimit = 100000;          // The maximum number of training cycles to use. This prevents an endless loop.



void setup(){
  size(900,700);
  sensorData=new ArrayList();
  expectedData=new ArrayList();
  outputFile1="C:/SensorReadings.txt";
  outputFile2="C:/ExpectedResult.txt";
  font = createFont(PFont.list()[2],32);
  textFont(font);
  myPort = new Serial(this, "COM13", 9600);
  myPort.bufferUntil('\n');
  network = new NeuralNetwork();
  network.addLayer(9,15);
  network.addLayer(15,4);
  updateScreen("",0,0,0);
}



void draw(){
  //Nothing happens here
}



void updateScreen(String statusText, int bkRed, int bkGrn, int bkBlu){
  background(bkRed, bkGrn, bkBlu);
  
  //Ambient box
  createBox(100,100,100,100,100,80,"Amb");
  
  //Red box
  createBox(300,100,100,255,0,0,"Red");
  
  //Yellow box
  createBox(500,100,100,255,255,0,"Yel");
  
  //Green box
  createBox(700,100,100,0,255,0,"Grn");
  
  //Status box
  createBox(100,200,700,100,100,200,statusText);
  
  //Detect Colour Box
  createBox(300,400,300,220,255,200,"Detect Colour Now");
  
  //Train Neural Network Box
  createBox(250, 300, 400, 30,30,30,"    Train Neural Network");
}


void createBox(int xPos, int yPos, int cbWidth, int Roy, int Gee, int Biv, String boxText){
  strokeWeight(3);
  fill(255);
  stroke(Roy,Gee,Biv);
  rect(xPos, yPos, cbWidth, 50);
  fill(0);
  text(boxText, xPos+20, yPos+35);
}


void mousePressed(){
    //Use "detecting" boolean variable to swap between calibrating and detecting.
    //The default is to calibrate, unless changed to true.
    detecting=false;
    
    //Ambient box
    if(checkMouseLimits(100,100,200,150)){
      updateScreen("Calibrating Ambient",0,0,0);
      expectedResult[0]=1;
      expectedResult[1]=0;
      expectedResult[2]=0;
      expectedResult[3]=0;
      sendSignal(intensity);
    } else
    
    //Red box
    if(checkMouseLimits(300,100,400,150)){
      updateScreen("Calibrating Red",0,0,0);
      expectedResult[0]=0;
      expectedResult[1]=1;
      expectedResult[2]=0;
      expectedResult[3]=0;
      sendSignal(intensity);
    } else
   
    //Yellow box
    if(checkMouseLimits(500,100,600,150)){
      updateScreen("Calibrating Yellow",0,0,0);
      expectedResult[0]=0;
      expectedResult[1]=0;
      expectedResult[2]=1;
      expectedResult[3]=0;
      sendSignal(intensity);
    } else
    
    //Green box
    if(checkMouseLimits(700,100,800,150)){
      updateScreen("Calibrating Green",0,0,0);
      expectedResult[0]=0;
      expectedResult[1]=0;
      expectedResult[2]=0;
      expectedResult[3]=1;
      sendSignal(intensity);
    } else
    
    //Train Neural Network Box
    if(checkMouseLimits(250,300,650,350)){
      updateScreen("Training Neural Network",0,0,0);
      trainNetwork();
      updateScreen("Network Trained",0,0,0);
    } else
   
    //Detect colour box
    if(checkMouseLimits(300,400,600,450)){
      updateScreen("Measuring",100,100,100);
      detecting=true;
      sendSignal(intensity);
    } else{
      updateScreen("Stopped",0,0,0);
      sendSignal(0);
    }
}


Boolean checkMouseLimits(float mXpos1, float mYpos1, float mXpos2, float mYpos2){
  if((mouseX>mXpos1) && (mouseX<mXpos2) && (mouseY>mYpos1) && (mouseY<mYpos2)){
    return true;
  } else {
    return false;
  }  
}


void sendSignal(int RGBintensity){
  println("Signal has been sent to Arduino: " + RGBintensity); 
  myPort.write(RGBintensity);
}


void serialEvent (Serial myPort){
 
  String serialString = myPort.readStringUntil('\n');
  if(serialString != null){
    serialString=trim(serialString);
  }
  //Convert String to Float
  sensorReadings[sensorReadCounter] = (Float.parseFloat(serialString))/1000;
  println("Reading #" + sensorReadCounter + ": " + sensorReadings[sensorReadCounter]);
  sensorReadCounter++;
  
  //If the array is full. Call the Interpreter(). 
  //Otherwise update the screen with the readings
  if(sensorReadCounter==sensorReadings.length){
    
    //then output the values to a files - only if detecting is false
    //if detecting is true, then send values through the neural network
    if(detecting){
      network.processInputsToOutputs(sensorReadings);
      networkResult = network.getOutputs();
      processNetworkResult(networkResult);
    }else {
      //append the data to the end of the file
      String outputSensorText="";
      for(int i=0; i<sensorReadings.length; i++){
        outputSensorText+=sensorReadings[i] + ",";
      }
      saveData(outputFile1,outputSensorText,true);
      
      //append the "answer" to the end of the expectedResults file.
      String outputExpectedText="";
      for(int i=0; i<expectedResult.length; i++){
        outputExpectedText+=expectedResult[i] + ",";
      }
      saveData(outputFile2,outputExpectedText,true);
    }
    sensorReadCounter=0;
  } else {
    //do nothing between readings
  }
}

void processNetworkResult(float[] nResult){
  float pos = 0.70;
  float neg = 0.30;
  
  println("Result1:" + nResult[0] + ", Result2:" + nResult[1] + ", Result3:" + nResult[2] + ", Result4:" + nResult[3]);
  //Check for ambient
  if(nResult[0]>pos && nResult[1]<neg && nResult[2]<neg && nResult[3]<neg){
    updateScreen("Ambient Light Detected", 100,100,100);
  } else
  //Check for Red
  if(nResult[0]<neg && nResult[1]>pos && nResult[2]<neg && nResult[3]<neg){
    updateScreen("Red Colour Detected", 255,0,0);
  } else
  //Check for Yellow
  if(nResult[0]<neg && nResult[1]<neg && nResult[2]>pos && nResult[3]<neg){
    updateScreen("Yellow Colour Detected", 255,255,0);
  } else
  //Check for Green
  if(nResult[0]<neg && nResult[1]<neg && nResult[2]<neg && nResult[3]>pos){
    updateScreen("Green Colour Detected", 0,255,0);
  }else{
    updateScreen("Unknown Colour - try again", 0,0,0);
  }
}


/* --------------------------------------------------------------
  SaveData:
  - This code is used to create/append any data to the designated file.
  - fileName = the location of the output data file (String)
  - newData = the data to be stored in the file (String)
  - appendData = true if you want to append, 
              = false if you want to create a new file
  --------------------------------------------------------------*/

void saveData(String fileName, String newData, boolean appendData){
  BufferedWriter bw=null;
  try {  
    FileWriter fw = new FileWriter(fileName, appendData);
    bw = new BufferedWriter(fw);
    bw.write(newData + System.getProperty("line.separator"));
  } catch (IOException e) {
  } finally {
    if (bw != null){
      try { 
        bw.close(); 
      } catch (IOException e) {}  
    }
  }
}


void readData(String myFileName, int fileType){
  File file=new File(myFileName);
  StringBuffer contents = new StringBuffer(); 
  BufferedReader br=null;
  
  try{
    br=new BufferedReader(new FileReader(file));
    String text=null;
    
    while((text=br.readLine())!=null){
      //YOU NEED TO RE-INITIALISE THESE VARIABLES OR ELSE THE ARRAYLIST DOES NOT POPULATE PROPERLY
      sensorReadings = new float[9]; // Used to store the 9 sensor readings
      expectedResult = new float[4]; // Used to store the 4 expected results
      
      //Convert the line of text into an array of numbers
      String [] subtext = splitTokens(text,",");
      
      //if fileType = 0 : then importing sensor data
      //otherwise : importing expected results
      if(fileType<1){
          
        for(int i=0; i<sensorReadings.length; i++){
          sensorReadings[i]=Float.parseFloat(subtext[i]);
        }
      
        //Add the array of readings to the ArrayList
        sensorData.add(sensorReadings);
        
      } else {
        
        for(int i=0; i<expectedResult.length; i++){
          expectedResult[i]=Float.parseFloat(subtext[i]);
        }
        
        //Add the array of readings to the ArrayList
        expectedData.add(expectedResult);
      }
    }
  }catch(FileNotFoundException e){
    e.printStackTrace();
  }catch(IOException e){
    e.printStackTrace();
  }finally{
    try {
      if (br != null){
        br.close();
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
}




void clearData(){
  //Prepare the sensorData ArrayList for new data, by clearing it
  sensorData.clear();
  //Prepare the expectedData ArrayList for new data, by clearing it
  expectedData.clear();
}




ArrayList randomiseArrayList(ArrayList aList){
  ArrayList randomList = new ArrayList();
  for (int i=aList.size(); i>0; i--){
    int randomIndex=int(random(i));
    randomList.add(aList.get(randomIndex));
    aList.remove(randomIndex);
  }
  return randomList;
}


/* ----------------------------------------------------------------------------------
 trainNetwork : is used to train the neural network in preparation for testing 
------------------------------------------------------------------------------------*/

void trainNetwork(){
   println("Training Started");
  //Clear the sensor and expected data ArrayLists before populating
    //clearData(); - This seems to confuse the network for some reason - need to investigate further.
  //send the data through the neural network training function
    readData(outputFile1,0);
    readData(outputFile2,1);
    if(sensorData.size()!=expectedData.size()){
      println("SensorData=" + sensorData.size() + ", ExpectedData=" + expectedData.size());
      println("Data does not match - exit");
      exit();
    } else {
        network.autoTrainNetwork(sensorData,expectedData, networkTrainingLimit,networkCycleLimit);
    }
    println("Network Trained - Training Error = " + network.trainingError);
}
  

/* -----------------------------------------------------------------------------------
A connection determines how much of a signal is passed through to the neuron. 
---------------------------------------------------------------------------------------   */

class Connection{
  float connEntry;
  float weight;
  float connExit;
  
  //This is the default constructor for an Connection
  Connection(){
    randomiseWeight();
  }
  
  //A custom weight for this Connection constructor
  Connection(float tempWeight){
    setWeight(tempWeight);
  }
  
  //Function to set the weight of this connection
  void setWeight(float tempWeight){
    weight=tempWeight;
  }
  
  //Function to randomise the weight of this connection
  void randomiseWeight(){
    setWeight(random(2)-1);
  }
  
  //Function to calculate and store the output of this Connection
  float calcConnExit(float tempInput){
    connEntry = tempInput;
    connExit = connEntry * weight;
    return connExit;
  }
}


/* -----------------------------------------------------------------------------------
   A neuron does all the processing and calculation to convert an input into an output
--------------------------------------------------------------------------------------  */

class Neuron{
  Connection[] connections={};
  float bias;
  float neuronInputValue;
  float neuronOutputValue;
  float deltaError;
  
  //The default constructor for a Neuron
  Neuron(){
  }
  
  //The typical constructor of a Neuron - with random Bias and Connection weights
  Neuron(int numOfConnections){
    randomiseBias();
    for(int i=0; i<numOfConnections; i++){
      Connection conn = new Connection();
      addConnection(conn);
    }
  }
  
  //Function to add a Connection to this neuron
  void addConnection(Connection conn){
      connections = (Connection[]) append(connections, conn);
  }
  
  //Function to return the number of connections associated with this neuron.
  int getConnectionCount(){
      return connections.length;
  }
  
  //Function to set the bias of this Neron
  void setBias(float tempBias){
    bias = tempBias;
  } 
  
  //Function to randomise the bias of this Neuron
  void randomiseBias(){
    setBias(random(1));
  }
  
  //Function to convert the inputValue to an outputValue
  //Make sure that the number of connEntryValues matches the number of connections
  
  float getNeuronOutput(float[] connEntryValues){
    if(connEntryValues.length!=getConnectionCount()){
      println("Neuron Error: getNeuronOutput() : Wrong number of connEntryValues");
      exit();
    } 
    
    neuronInputValue=0;
    
    //First SUM all of the weighted connection values (connExit) attached to this neuron. This becomes the neuronInputValue.
    for(int i=0; i<getConnectionCount(); i++){
      neuronInputValue+=connections[i].calcConnExit(connEntryValues[i]);
    }
    
    //Add the bias to the Neuron's inputValue
    neuronInputValue+=bias;
    
    //Send the inputValue through the activation function to produce the Neuron's outputValue
    neuronOutputValue=Activation(neuronInputValue);
    
    //Return the outputValue
    return neuronOutputValue;
  } 
  
  //Activation function
  float Activation(float x){
    float activatedValue = 1 / (1 + exp(-1 * x));
    return activatedValue;
  }
  
}


/* -----------------------------------------------------------------------------------
   A layer manages the neuron communication and learning
--------------------------------------------------------------------------------------  */


class Layer{
  Neuron[] neurons = {};
  float[] layerINPUTs={};
  float[] actualOUTPUTs={};
  float[] expectedOUTPUTs={};
  float layerError;
  float learningRate;
  
  
  /* This is the default constructor for the Layer */
  Layer(int numberConnections, int numberNeurons){
    /* Add all the neurons and actualOUTPUTs to the layer */
    for(int i=0; i<numberNeurons; i++){
      Neuron tempNeuron = new Neuron(numberConnections);
      addNeuron(tempNeuron);
      addActualOUTPUT();
    }
  }
    
  
  /* Function to add an input or output Neuron to this Layer */
  void addNeuron(Neuron xNeuron){
        neurons = (Neuron[]) append(neurons, xNeuron);
  }
  
  
  /* Function to get the number of neurons in this layer */
  int getNeuronCount(){
    return neurons.length;
  }
  
  
  /* Function to increment the size of the actualOUTPUTs array by one. */
  void addActualOUTPUT(){
      actualOUTPUTs = (float[]) expand(actualOUTPUTs,(actualOUTPUTs.length+1));
  }
  
  
  /* Function to set the ENTIRE expectedOUTPUTs array in one go. */
  void setExpectedOUTPUTs(float[] tempExpectedOUTPUTs){
    expectedOUTPUTs=tempExpectedOUTPUTs;
  }
  
  
  /* Function to clear ALL values from the expectedOUTPUTs array */
  void clearExpectedOUTPUT(){
       expectedOUTPUTs = (float[]) expand(expectedOUTPUTs, 0);
  }
  
  
  /* Function to set the learning rate of the layer */
  void setLearningRate(float tempLearningRate){
    learningRate=tempLearningRate;
  }
  
  
  /* Function to set the inputs of this layer */
  void setInputs(float[] tempInputs){
    layerINPUTs=tempInputs;
  }
  
  
  
  /* Function to convert ALL the Neuron input values into Neuron output values in this layer, 
     through a special activation function. */
  void processInputsToOutputs(){
    
    /* neuronCount is used a couple of times in this function. */
    int neuronCount = getNeuronCount();
    
    /* Check to make sure that there are neurons in this layer to process the inputs */
    if(neuronCount>0) {
      /* Check to make sure that the number of inputs matches the number of Neuron Connections. */
      if(layerINPUTs.length!=neurons[0].getConnectionCount()){
        println("Error in Layer: processInputsToOutputs: The number of inputs do NOT match the number of Neuron connections in this layer");
        exit();
      } else {
        /* The number of inputs are fine : continue
           Calculate the actualOUTPUT of each neuron in this layer, 
           based on their layerINPUTs (which were previously calculated).
           Add the value to the layer's actualOUTPUTs array. */
        for(int i=0; i<neuronCount;i++){
          actualOUTPUTs[i]=neurons[i].getNeuronOutput(layerINPUTs);
        }
      }
    }else{
      println("Error in Layer: processInputsToOutputs: There are no Neurons in this layer");
      exit();
    }
  }
  
  
  /* Function to get the error of this layer */
  float getLayerError(){
    return layerError;
  }
  
  
  /* Function to set the error of this layer */
  void setLayerError(float tempLayerError){
    layerError=tempLayerError;
  }
  
  
  /* Function to increase the layerError by a certain amount */
  void increaseLayerErrorBy(float tempLayerError){
    layerError+=tempLayerError;
  }
  
  
  /* Function to calculate and set the deltaError of each neuron in the layer */
  void setDeltaError(float[] expectedOutputData){
    setExpectedOUTPUTs(expectedOutputData);
    int neuronCount = getNeuronCount();
    /* Reset the layer error to 0 before cycling through each neuron */
    setLayerError(0);
     for(int i=0; i<neuronCount;i++){
       neurons[i].deltaError = actualOUTPUTs[i]*(1-actualOUTPUTs[i])*(expectedOUTPUTs[i]-actualOUTPUTs[i]);
       
       /* Increase the layer Error by the absolute difference between the calculated value (actualOUTPUT) 
          and the expected value (expectedOUTPUT). */
       increaseLayerErrorBy(abs(expectedOUTPUTs[i]-actualOUTPUTs[i]));
     }
  }
  
  
  /* Function to train the layer : which uses a training set to adjust the connection weights 
     and biases of the neurons in this layer */
  void trainLayer(float tempLearningRate){
    setLearningRate(tempLearningRate);
    
    int neuronCount = getNeuronCount();
    
    for(int i=0; i<neuronCount;i++){
      /* update the bias for neuron[i] */
      neurons[i].bias += (learningRate * 1 * neurons[i].deltaError);
      
      /* update the weight of each connection for this neuron[i] */
      for(int j=0; j<neurons[i].getConnectionCount(); j++){
          neurons[i].connections[j].weight += (learningRate * neurons[i].connections[j].connEntry * neurons[i].deltaError);
      }   
    }
  }
}

/* -------------------------------------------------------------------------------------------
   The Neural Network class is a container to hold and manage all the layers 
   ------------------------------------------------------------------------------------------- */

class NeuralNetwork{
  Layer[] layers = {};
  float[] arrayOfInputs={};
  float[] arrayOfOutputs={};
  float learningRate;
  float networkError;
  float trainingError;
  int retrainChances=0;
  
  NeuralNetwork(){
    /* the default learning rate of a neural network is set to 0.1, which can changed by the setLearningRate(lR) function. */
    learningRate=0.1;
  }
  
  
  
  /* Function to add a Layer to the Neural Network */
  void addLayer(int numConnections, int numNeurons){
    layers = (Layer[]) append(layers, new Layer(numConnections,numNeurons));
  }



  /* Function to return the number of layers in the neural network */
  int getLayerCount(){
      return layers.length;
  }
  
  
  
  /* Function to set the learningRate of the Neural Network */
  void setLearningRate(float tempLearningRate){
    learningRate=tempLearningRate;
  }
  
  
  
  /* Function to set the inputs of the neural network */
  void setInputs(float[] tempInputs){
    arrayOfInputs=tempInputs;
  }
  
  
  
  /* Function to set the inputs of a specified layer */
  void setLayerInputs(float[] tempInputs, int layerIndex){
    if(layerIndex>getLayerCount()-1){
      println("NN Error: setLayerInputs: layerIndex=" + layerIndex + " exceeded limits= " + (getLayerCount()-1));
    } else {
      layers[layerIndex].setInputs(tempInputs);
    }
  }
  
  
  
  /* Function to set the outputs of the neural network */
  void setOutputs(float[] tempOutputs){
    arrayOfOutputs=tempOutputs;
  }
  
  
  
  /* Function to return the outputs of the Neural Network */
  float[] getOutputs(){
    return arrayOfOutputs;
  }
  
  
  
  /* Function to process the Neural Network's input values and convert them to an output pattern using ALL layers in the network */
  void processInputsToOutputs(float[] tempInputs){
    setInputs(tempInputs);
    
    /* Check to make sure that the number of NeuralNetwork inputs matches the Neuron Connection Count in the first layer. */
    if(getLayerCount()>0){
      if(arrayOfInputs.length!=layers[0].neurons[0].getConnectionCount()){
        println("NN Error: processInputsToOutputs: The number of inputs do NOT match the NN");
        exit();
      } else {
        /* The number of inputs are fine : continue */
        for(int i=0; i<getLayerCount(); i++){
          
          /*Set the INPUTs for each layer: The first layer gets it's input data from the NN,
            whereas the 2nd and subsequent layers get their input data from the previous 
            layer's actual output. */
          if(i==0){
            setLayerInputs(arrayOfInputs,i);
          } else {
            setLayerInputs(layers[i-1].actualOUTPUTs, i);
          }
          
          /* Now that the layer has had it's input values set, it can now process this data, and convert them
             into an output using the layer's neurons. The outputs will be used as inputs in the next layer (if available). */
          layers[i].processInputsToOutputs();
        }
        /* Once all the data has filtered through to the end of network, we can grab the actualOUTPUTs of the LAST layer
           These values become or will be set to the NN output values (arrayOfOutputs), through the setOutputs function call. */
        setOutputs(layers[getLayerCount()-1].actualOUTPUTs);
      }
    }else{
      println("Error: There are no layers in this Neural Network");
      exit();
    }
  }
  
  
  
  
  /* Function to train the entire network using an array. */
  void trainNetwork(float[] inputData, float[] expectedOutputData){
    /* Populate the ENTIRE network by processing the inputData. */
    processInputsToOutputs(inputData);
    
    /* train each layer - from back to front (back propagation) */
    for(int i=getLayerCount()-1; i>-1; i--){
      if(i==getLayerCount()-1){
        layers[i].setDeltaError(expectedOutputData);
        layers[i].trainLayer(learningRate);
        networkError=layers[i].getLayerError();
      } else {
        /* Calculate the expected value for each neuron in this layer (eg. HIDDEN LAYER) */
        for(int j=0; j<layers[i].getNeuronCount(); j++){
          /* Reset the delta error of this neuron to zero. */
          layers[i].neurons[j].deltaError=0;
          /* The delta error of a hidden layer neuron is equal to the SUM of [the PRODUCT of the connection.weight and error of the neurons in the next layer(eg OUTPUT Layer)]. */
          /* Connection#1 of each neuron in the output layer connect with Neuron#1 in the hidden layer */
          for(int k=0; k<layers[i+1].getNeuronCount(); k++){
            layers[i].neurons[j].deltaError += (layers[i+1].neurons[k].connections[j].weight * layers[i+1].neurons[k].deltaError);
          }
          /* Now that we have the sum of Errors x weights attached to this neuron. 
             We must multiply it by the derivative of the activation function. */
          layers[i].neurons[j].deltaError *= (layers[i].neurons[j].neuronOutputValue * (1-layers[i].neurons[j].neuronOutputValue));
        }
        /* Now that you have all the necessary fields populated, you can now
           Train this hidden layer and then clear the Expected outputs, ready for the next round. */
        layers[i].trainLayer(learningRate);
        layers[i].clearExpectedOUTPUT();
      }
    } 
  }
  
  
  
  
  
  /* Function to train the entire network, using an array of input and expected data within an ArrayList */
  void trainingCycle(ArrayList trainingInputData, ArrayList trainingExpectedData, Boolean trainRandomly){
      int dataIndex;
      
      /* re-initialise the training Error with every cycle */
      trainingError=0;
      
      /* Cycle through the training data either randomly or sequentially */
      for(int i=0; i<trainingInputData.size(); i++){
        if(trainRandomly){
          dataIndex=(int) (random(trainingInputData.size()));
        } else {
          dataIndex=i;
        }
 
        trainNetwork((float[]) trainingInputData.get(dataIndex),(float[]) trainingExpectedData.get(dataIndex));
        
        /* Use the networkError variable which is calculated at the end of each individual training session to calculate the entire trainingError. */
        trainingError+=abs(networkError);
      }
  }
  
  
  
  
  
  /* Function to train the network until the Error is below a specific threshold */
  void autoTrainNetwork(ArrayList trainingInputData, ArrayList trainingExpectedData, float trainingErrorTarget, int cycleLimit){
    trainingError=9999;
    int trainingCounter=0;
    
    
    /* cycle through the training data until the trainingError gets below trainingErrorTarget (eg. 0.0005) or the training cycles have exceeded the cycleLimit variable (eg. 10000). */
    while(trainingError>trainingErrorTarget && trainingCounter<cycleLimit){
      
      /* re-initialise the training Error with every cycle */
      trainingError=0;
      
      /* Cycle through the training data randomly */
      trainingCycle(trainingInputData, trainingExpectedData, true);
      
      /* increment the training counter to prevent endless loop */
      trainingCounter++;
    }
    
    /* Due to the random nature in which this neural network is trained. There may be occasions when the training error may drop below the threshold 
       To check if this is the case, we will go through one more cycle (but sequentially this time), and check the trainingError for that cycle
       If the training error is still below the trainingErrorTarget, then we will end the training session.
       If the training error is above the trainingErrorTarget, we will continue to train. It will do this check a  Maximum of 9 times. */
    if(trainingCounter<cycleLimit){
       trainingCycle(trainingInputData, trainingExpectedData, false);
       trainingCounter++;
      
       if(trainingError>trainingErrorTarget){
         if (retrainChances<10){
           retrainChances++;
           autoTrainNetwork(trainingInputData, trainingExpectedData,trainingErrorTarget, cycleLimit);
         }
       }
       
    } else {
      println("CycleLimit has been reached. Has been retrained " + retrainChances + " times.  Error is = " + trainingError);
    }   
  } 
}





