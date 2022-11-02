PImage img;
boolean overButton = false;

void setup(){
  size(250,250);
  img = loadImage("qr-code.png");
}

void draw(){
  background(0);
  image(img, 0, 0, width, height);


if (overButton == true) {
    fill(0, 0, 255, 50);
  } else {
    noFill();
  }
  
  rect(0, 0, 250, 250);
 
}

  void mousePressed() {
  if (overButton) { 
    link("https://github.com/StellaPiperaki/Advanced-Interaction-Tecnologies-Applications-Individual-Assignment");
  }
}

void mouseMoved() { 
  checkButtons(); 
}
  
void mouseDragged() {
  checkButtons(); 
}

void checkButtons() {
  if (mouseX > 105 && mouseX < 180 && mouseY >90 && mouseY <135) {
    overButton = true;   
  } else {
    overButton = false;
  }
}
