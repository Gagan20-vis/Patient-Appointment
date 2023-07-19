<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" type="image/x-icon" href="./images/favicon.ico" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./css/style.css" />

    <title>Patient Appointment with Doctor</title>
  </head>
  <body>
    <input type="hidden" id="status"
    value="<%=request.getAttribute("status")%>">
    <nav class="navbar navbar-expand-lg navbar-light bg-primary bg-gradient">
      <div class="container-fluid">
        <a class="navbar-brand" href="#"
          ><img
            src="images/doctor.png"
            alt=""
            style="height: 70px; width: 70px"
        /></a>
        <div class="collapse navbar-collapse" id="navbarNav">
          <a class="navbar-brand" id="nav-heading" href="#"
            >Patient Appointment With Doctor</a
          >
          <ul class="navbar-nav ms-auto">
            <li class="nav-item mx-0 mx-lg-1">
              <a
                class="nav-link py-3 px-0 px-lg-3 rounded"
                aria-current="page"
                href="index.jsp"
                >Home</a
              >
            </li>
            <li class="nav-item mx-0 mx-lg-1 dropdown">
              <a
                class="nav-link dropdown-toggle py-3 px-0 px-lg-3 rounded"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                style="color: black"
                aria-expanded="false"
              >
                Register
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li>
                  <a class="dropdown-item" href="register.jsp?fields=4"
                    >Patient</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="register.jsp?fields=6"
                    >Doctor</a
                  >
                </li>
              </ul>
            </li>
            <li class="nav-item mx-0 mx-lg-1 dropdown">
              <a
                class="nav-link dropdown-toggle py-3 px-0 px-lg-3 rounded"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                style="color: black"
                aria-expanded="false"
              >
                Login
              </a>
              <ul
                class="dropdown-menu"
                aria-labelledby="navbarDropdown"
                style="overflow: hidden"
              >
                <li>
                  <a class="dropdown-item" href="signin.jsp?fields=4"
                    >Patient</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="signin.jsp?fields=6">Doctor</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="header_hero">
      <div class="contianer">
        <div class="row">
          <div class="col-lg-5 col-10 mx-auto">
            <div class="form-side">
              <h2>Your health is your greatest wealth</h2>
              <a href="signin.jsp?fields=4" class="submit">Book Appointment</a>
            </div>
          </div>
          <!-- right side images -->
          <div class="col-lg-4 col-1 mx-auto">
            <figure class="header_hero__img">
              <img src="./images/doct_full.png" class="doctor_right" />
            </figure>
          </div>
        </div>
      </div>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
      let msg = document.getElementById("status").value;
      if (msg == "success") {
        swal("Congrats", "Registration Successfull", "success");
      }
    </script>
    <div class="footer">Created By Gagan Vishwakarma . All Right Reserved!</div>
  </body>
</html>
