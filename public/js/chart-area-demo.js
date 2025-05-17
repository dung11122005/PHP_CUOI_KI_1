// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart for Monthly Revenue
var odermonthlyRevenue = []
for (var i = 0; i < 12; i++) {
  odermonthlyRevenue.push(Number(monthlyRevenue[i]));
}

console.log(odermonthlyRevenue);
document.addEventListener("DOMContentLoaded", function () {
  var ctx = document.getElementById("myAreaChart");

  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
      datasets: [{
        label: "Doanh thu (VNĐ)",
        lineTension: 0.3,
        backgroundColor: "rgba(2,117,216,0.2)",
        borderColor: "rgba(2,117,216,1)",
        pointRadius: 5,
        pointBackgroundColor: "rgba(2,117,216,1)",
        pointBorderColor: "rgba(255,255,255,0.8)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(2,117,216,1)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: odermonthlyRevenue,
      }],
    },
    options: {
      scales: {
        xAxes: [{
          gridLines: { display: false },
          ticks: { maxTicksLimit: 12 }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true,
            callback: function(value) {
              return value.toLocaleString('vi-VN') + ' ₫'; 
            }
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          }
        }],
      },
      legend: {
        display: true
      }
    }
  });
});
