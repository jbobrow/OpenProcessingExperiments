
class Bar {
  float targetData;
  float distance;
  int row;
  float vSpeed;
  float data;
  
  Bar(float targetData, int row) {
    this.targetData = targetData;
    this.row = row;  
    this.distance = targetData;
    this.data = random((maxValue[dataReferences[currentData]]/2) + targetData);
  }
  
  void updateBar() {
    distance = targetData - data;
    vSpeed += distance*0.02;
    data += vSpeed;
    vSpeed *= 0.96;
  }
  
  void drawBar(){
    updateBar();
    
    int index = dataReferences[currentData];
    float mapColor = map(data, minValue[index], maxValue[index], 0, 150);
    fill(200, 100+(int)mapColor, 0);
    
    float mapValue = map(data, minValue[index], maxValue[index], 10, vizHeight-40);
    if(targetData == maxValue[index]){
      stroke(255, 255, 255);
      strokeWeight(3);
    }
       
    rect(row*spacePerOneBar+15, zeroAxis, spacePerOneBar/2 - 5, -(int)mapValue);
    text(data, row*spacePerOneBar+10, vizHeight-(int)mapValue+7);
    stroke(0, 0, 200);
    strokeWeight(1);
  }
}

