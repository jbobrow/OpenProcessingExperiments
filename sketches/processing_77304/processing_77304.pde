
void draw() {

 image(back, 0, 0);
 
 image(eco, 20, 20);
 image(energy, 20, 100);
 
 if(state == 1){
   //text("EcoGame", width/2, height/2);
   image(nonLoopingGifIntro, width/2 - nonLoopingGifIntro.width/2, height/2 - nonLoopingGifIntro.height/2);
   
   if(mousePressed){
     state = 2;
   }
 }
  
 
 if(state == 2){
 //image(UI, 0, 0);
 
 //earth
 ellipseMode(CORNER);
  noStroke();
  fill(131, 178, 93);
  ellipse(206, 106, 388, 388);
  
  //eco
  //text("Eco:" + round(ecoValue), 10, 50);
  
  if(ecoValue >= 1){
    fill(255, 0, 0);
    rect(75, 59, 20, 2);
  }
  if(ecoValue >= 2){
    fill(237, 91, 91);
    rect(75, 55, 20, 2);
  }
   if(ecoValue >= 3){
     fill(240, 119, 119);
    rect(75, 51, 20, 2);
  }
   if(ecoValue >= 4){
     fill(245, 161, 161);
    rect(75, 47, 20, 2);
  }
   if(ecoValue >= 5){
     fill(250, 207, 207);
    rect(75, 43, 20, 2);
  }
   if(ecoValue >= 6){
     fill(108, 180, 104);
    rect(75, 39, 20, 2);
  }
   if(ecoValue >= 7){
     fill(80, 165, 75);
    rect(75, 35, 20, 2);
  }
   if(ecoValue >= 8){
     fill(54, 152, 48);
    rect(75, 31, 20, 2);
    
  }
   if(ecoValue >= 9){
     fill(34, 137, 28);
    rect(75, 27, 20, 2);
  }
   if(ecoValue >= 10){
     fill(14, 111, 8);
    rect(75, 23, 20, 2);
  }
  if(ecoValue < 3){
  ellipseMode(CORNER);
  noStroke();
  fill(107, 142, 77);
  ellipse(206, 106, 388, 388); 
    
  }
   if(ecoValue < 1){
  ellipseMode(CORNER);
  noStroke();
  fill(73, 85, 62);
  ellipse(206, 106, 388, 388);
   }
  
  //power
  //text("Power:" + round(powerValue), 10, 80);
   
   if(powerValue >= 1){
     fill(0);
    rect(75, 138, 20, 2);
  }
  if(powerValue >= 2){
    fill(49, 48, 41);
    rect(75, 134, 20, 2);
  }
  if(powerValue >= 3){
    fill(80, 7, 59);
    rect(75, 130, 20, 2);
  }
  if(powerValue >= 4){
    fill(95, 91, 64);
    rect(75, 126, 20, 2);
  }
  if(powerValue >= 5){
    fill(167, 166, 76);
    rect(75, 122, 20, 2);
  }
  if(powerValue >= 6){
    fill(183, 181, 67);
    rect(75, 118, 20, 2);
  }
  if(powerValue >= 7){
    fill(193, 191, 53);
    rect(75, 114, 20, 2);
  }
  if(powerValue >= 8){
    fill(211, 209, 41);
    rect(75, 110, 20, 2);
  
  
  }
  if(powerValue >= 9){
    fill(229, 226, 23);
    rect(75, 106, 20, 2);
  }
  if(powerValue >= 10){
    fill(255, 255, 0);
    rect(75, 102, 20, 2);
  }
 }

 
 
 //animation
 
 //tree
 //if(treeCount < 10){
  if (treeState == -1 && treeCount < 10){
   image(loopingGif, 36, 538);
  }
  if (treeState == 0){
    image(tree, mouseX - tree.width/2, mouseY - tree.height/2);
  }
 //turbine
  if (turbineState == -1 && turbineCount < 5){
    image(loopingGifTurbine, 567, 534);
   //image(turbine, 567, 534);
   }
  if (turbineState == 0){
    image(turbine, mouseX - turbine.width/2, mouseY - turbine.height/2);
  }
  //building
  if (buildingState == -1 && buildingCount <5){
    image(loopingGifBuilding, 299, 536);
    //image(building, 299, 536);
  }
  if (buildingState == 0){
    image(building, mouseX - building.width/2, mouseY - building.height/2);
  }
  //car
  if (carState == -1 && carCount < 10){
    image(loopingGifCar, 408, 570);
   //image(car, 408, 570);
  }
  if (carState == 0){
    image(car, mouseX - car.width/2, mouseY - car.height/2);
  }
   //factory
  if (factoryState == -1 && factoryCount < 3){
    image(loopingGifFactory, 676, 533);
    //image(factory, 676, 533);
  }
  if (factoryState == 0){
    image(factory, mouseX - factory.width/2, mouseY - factory.height/2);
  }
  //house
  if (houseState == -1 && houseCount < 10) {
    image(loopingGifHouse, 154, 556);
   }
  if (houseState == 0) {
    image(house, mouseX - house.width/2, mouseY - house.height/2);
  }
 
 
 
 
 
 //popup 
 if(treeCount > 0){
   image(treeWorld[treeCount], 0, 0);
 }
 if(houseCount > 0){
   image(houseWorld[houseCount], 0, 0);
 }
 if(buildingCount > 0){
   image(buildingWorld[buildingCount], 0, 0);
 }
 if(carCount > 0){
   image(carWorld[carCount], 0, 0);
 }
  if(turbineCount > 0){
   image(turbineWorld[turbineCount], 0, 0);
  }
  if(factoryCount > 0){
   image(factoryWorld[factoryCount], 0, 0);
  }
 
//tree
  if (treeState == -1) {
    //image(tree, 38, 546);
  }
  if (treeState == 0) {
    image(tree, mouseX - tree.width/2, mouseY - tree.height/2);
  }
  //
  //house
   if (houseState == -1) {
    //image(house, 144, 542);
  }
  if (houseState == 0) {
    image(house, mouseX - house.width/2, mouseY - house.height/2);
  }
  
  //building
   if (buildingState == -1) {
    //image(building, 286, 522);
  }
  if (buildingState == 0) {
    image(building, mouseX - house.width/2, mouseY - house.height/2);
  }
  
   //car
  if (carState == -1){
    //image(car, 394, 554);
  }
  if (carState == 0){
    image(car, mouseX - car.width/2, mouseY - car.height/2);
  }
  
  //turbine
  if (turbineState == -1){
    //image(turbine, 550, 510);
  }
  if (turbineState == 0){
    image(turbine, mouseX - turbine.width/2, mouseY - turbine.height/2);
  }
   //factory
  if (factoryState == -1){
    //image(factory, 654, 523);
  }
  if (factoryState == 0){
    image(factory, mouseX - factory.width/2, mouseY - factory.height/2);
  }
  
  
 }

