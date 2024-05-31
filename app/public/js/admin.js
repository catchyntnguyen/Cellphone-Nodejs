let drop_down = document.querySelectorAll('.nav-item--animation');
let list_item = document.querySelectorAll('.list-item');
let item_arow = document.querySelectorAll('.item-arow');

drop_down.forEach((item, index) => {
  item.addEventListener('click', () => {

    if (list_item[index].style.display === 'none' || list_item[index].style.display === '') {
      list_item[index].style.display = 'block';
      item_arow[index].innerHTML = '<i class="fas fa-chevron-down"></i>';
    } else {
      list_item[index].style.display = 'none';
      item_arow[index].innerHTML = '<i class="fas fa-chevron-left"></i>';
    }
  });
});

item_arow.forEach((arrow) => {
  arrow.innerHTML = '<i class="fas fa-chevron-left"></i>';
});
// chart
const xValues = [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150];
const yValues = [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,0,255,1.0)",
      borderColor: "rgba(0,0,255,0.1)",
      data: yValues
    }]
  },
  options: {
    legend: { display: false },
    scales: {
      yAxes: [{ ticks: { min: 6, max: 16 } }],
    }
  }
});
drop
document.querySelector('#drop').addEventListener('click', function(){
    // Sử dụng === hoặc == để so sánh giá trị, không phải sử dụng =
    if(document.querySelector('#drop_list').style.display === 'block'){
        document.querySelector('#drop_list').style.display = 'none';
    } else {
        document.querySelector('#drop_list').style.display = 'block';
    }
});


// drop
document.querySelector('#drop').addEventListener('click', function(){
  // Sử dụng === hoặc == để so sánh giá trị, không phải sử dụng =
  if(document.querySelector('#drop_list').style.display === 'block'){
      document.querySelector('#drop_list').style.display = 'none';
  } else {
      document.querySelector('#drop_list').style.display = 'block';
  }
});