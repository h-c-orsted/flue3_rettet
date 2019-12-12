// Defining array to hold all objects
ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

void draw(){
  // Clear canvas and set background color
  clear();
  background(200, 200, 200);
  
  // Draw each object from array
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}

// When key is pressed, add new random fly
void keyPressed(){
  flueListe.add(new Flue());
}


// When mouse pressed, add new fly at mouse position
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY));
}



/////////////////////////////////////////////////////////
class Flue{
  
  // Vars to hold data on each instance
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  
  // Constructor for a ranom fly
  Flue(){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
  }
  
  // Constructor for a fly at mouse coordinates
  Flue(float a, float b){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
  }
  
  // Move fly when called
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;
  }

  // Draw the fly when called. 
  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
//////////////////////////////////////////////////////
