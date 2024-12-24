import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";
import "./App.css";
import toast from "react-hot-toast";
import axios from "axios";

function App() {
  const handleCallApiTest = async () => {
    await axios
      .get("https://demoback.bremmo.in/")
      .then((res) => {
        const response = res.data.message
        toast.success(response)
      })
      .catch((err) => {
        console.log(err);
      });
  };
  return (
    <>
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Development  + Operation</h1>
      <div className="card">
        <button onClick={handleCallApiTest}>Hit me to call API</button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </>
  );
}

export default App;
