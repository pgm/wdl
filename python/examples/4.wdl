task wc {
  command {
    echo "${str}" | wc -c
  }
  output {
    Int count = read_int("stdout") - 1
  }
}

workflow wf {
  Array[Array[Array[String]]] triple_array
  scatter(double_array in triple_array) {
    scatter(single_array in double_array) {
      scatter(item in single_array) {
        call wc{input: str=item}
      }
    }
  }
}
