#1-Kilometer-Cutout{
  ::case[zoom>=12]{
  line-join: round;
  line-color: #ededed;
  opacity: 0.4;
  line-width: 1;
  line-dasharray: 3,2;
  }
}

#10-Kilometer-Cutout{
::case[zoom>=9][zoom<12]{
  line-join: round;
  line-color: #ededed;
  opacity: 0.4;
  line-width: 1;
  line-dasharray: 3,2;
  }
}
