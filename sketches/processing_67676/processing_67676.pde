
// Simple Cell Class
// Nathan Riggs -- Aug 2012

// Very early on, the rules array was abandoned in this project; however, 
// I've left the functionality for future possibilities.

class Cell {
 
 double threshhold, quanta;
 double[] rules = new double[10];
 
 // constructor
 // USAGE: Cell( {threshold, quanta, ...} )
 Cell(double[] r) {
   rules = r;
   threshhold = rules[0];
   quanta = rules[1];
 }
 
 // constructor, no arguments
 Cell() {
   rules[0] = 100;
   rules[1] = 100000;
 }
 
 // set rules, but also change threshold and quanta values
 void setRules(double[] r) {
   rules = r;
   threshhold = r[0];
   quanta = r[1];
 }
 
 // set the threshold
 void setThreshhold(double t) {
   threshhold = t;
 }
 
 // set quanta (energy, z-axis, ether, whatever you want to call it)
 void setQuanta(double q) {
   quanta = q;
 }
 
 // return an array of the current set rules
 double[] getRules() {
   return rules;
 }
 
 // return threshhold
 double getThreshhold() {
   return threshhold;
 }
 
 //return quanta
 double getQuanta() {
   return quanta;
 }
}


