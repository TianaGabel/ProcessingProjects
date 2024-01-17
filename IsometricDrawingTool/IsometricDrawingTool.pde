String IMG_PATH = "IsometricToolBarV1.png";
PImage toolBar;

void setup() {
  toolBar = loadImage(IMG_PATH);
  size(640, 360);
  background(102);
}

void draw() {
  image(toolBar,0,0);
  stroke(255);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
